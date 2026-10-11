document.addEventListener('DOMContentLoaded', () => {
    // Update Navbar based on Auth State
    const user = AuthService.getCurrentUser();
    const authLinks = document.getElementById('auth-links');
    
    if (authLinks) {
        if (user) {
            const dashboardLink = user.role === 'client' ? 'client-dashboard.html' : 'freelancer-dashboard.html';
            authLinks.innerHTML = `
                <li class="nav-item"><a class="nav-link" href="${dashboardLink}">Dashboard</a></li>
                <li class="nav-item"><a class="nav-link" href="#" id="logout-btn">Logout (${user.name})</a></li>
            `;
            
            document.getElementById('logout-btn').addEventListener('click', (e) => {
                e.preventDefault();
                AuthService.logout();
            });
        } else {
            authLinks.innerHTML = `
                <li class="nav-item"><a class="nav-link" href="login.html">Login</a></li>
                <li class="nav-item"><a class="btn btn-primary ms-2" href="register.html">Sign Up</a></li>
            `;
        }
    }
});

// Common utility to show alerts
const showAlert = (message, type = 'danger', containerId = 'alert-container') => {
    const container = document.getElementById(containerId);
    if (!container) return;
    
    container.innerHTML = `
        <div class="alert alert-${type} alert-dismissible fade show" role="alert">
            ${message}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    `;
};
