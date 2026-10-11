const API_URL = (window.location.protocol === 'file:' || (window.location.hostname === 'localhost' && window.location.port !== '5000'))
    ? 'http://localhost:5000/api'
    : '/api';

const fetchAPI = async (endpoint, options = {}) => {
    const token = localStorage.getItem('token');
    
    const headers = {
        'Content-Type': 'application/json',
        ...options.headers
    };

    if (token) {
        headers['Authorization'] = `Bearer ${token}`;
    }

    try {
        const response = await fetch(`${API_URL}${endpoint}`, {
            ...options,
            headers
        });

        const data = await response.json();
        
        if (!response.ok) {
            throw new Error(data.message || 'API request failed');
        }
        
        return data;
    } catch (error) {
        console.error('API Error:', error);
        throw error;
    }
};

const AuthService = {
    login: async (email, password) => {
        const data = await fetchAPI('/auth/login', {
            method: 'POST',
            body: JSON.stringify({ email, password })
        });
        localStorage.setItem('token', data.token);
        localStorage.setItem('user', JSON.stringify(data.user));
        return data;
    },
    register: async (userData) => {
        return await fetchAPI('/auth/register', {
            method: 'POST',
            body: JSON.stringify(userData)
        });
    },
    logout: () => {
        localStorage.removeItem('token');
        localStorage.removeItem('user');
        window.location.href = 'login.html';
    },
    getCurrentUser: () => {
        const user = localStorage.getItem('user');
        return user ? JSON.parse(user) : null;
    }
};

const ProjectService = {
    getAllProjects: async () => {
        return await fetchAPI('/projects');
    },
    getProjectById: async (id) => {
        return await fetchAPI(`/projects/${id}`);
    },
    createProject: async (projectData) => {
        return await fetchAPI('/projects', {
            method: 'POST',
            body: JSON.stringify(projectData)
        });
    }
};

const ProposalService = {
    submitProposal: async (proposalData) => {
        return await fetchAPI('/proposals', {
            method: 'POST',
            body: JSON.stringify(proposalData)
        });
    }
}
