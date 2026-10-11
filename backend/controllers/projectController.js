const db = require('../config/db');

const getProjects = async (req, res) => {
    try {
        const [projects] = await db.query(`
            SELECT p.*, u.name as client_name 
            FROM projects p 
            JOIN users u ON p.client_id = u.id 
            ORDER BY p.created_at DESC
        `);
        res.json(projects);
    } catch (error) {
        res.status(500).json({ message: 'Server error', error: error.message });
    }
};

const getProjectById = async (req, res) => {
    try {
        const [projects] = await db.query(`
            SELECT p.*, u.name as client_name 
            FROM projects p 
            JOIN users u ON p.client_id = u.id 
            WHERE p.id = ?
        `, [req.params.id]);

        if (projects.length === 0) {
            return res.status(404).json({ message: 'Project not found' });
        }
        res.json(projects[0]);
    } catch (error) {
        res.status(500).json({ message: 'Server error', error: error.message });
    }
};

const createProject = async (req, res) => {
    try {
        const { title, description, category, budget, deadline, experience_level } = req.body;
        const [result] = await db.query(
            'INSERT INTO projects (client_id, title, description, category, budget, deadline, experience_level) VALUES (?, ?, ?, ?, ?, ?, ?)',
            [req.user.id, title, description, category, budget, deadline, experience_level]
        );
        res.status(201).json({ message: 'Project created successfully', projectId: result.insertId });
    } catch (error) {
        res.status(500).json({ message: 'Server error', error: error.message });
    }
};

const updateProject = async (req, res) => {
    try {
        const { title, description, category, budget, deadline, experience_level, status } = req.body;
        
        // Verify ownership
        const [projects] = await db.query('SELECT client_id FROM projects WHERE id = ?', [req.params.id]);
        if (projects.length === 0) return res.status(404).json({ message: 'Project not found' });
        if (projects[0].client_id !== req.user.id) return res.status(403).json({ message: 'Not authorized' });

        await db.query(
            'UPDATE projects SET title=?, description=?, category=?, budget=?, deadline=?, experience_level=?, status=? WHERE id=?',
            [title, description, category, budget, deadline, experience_level, status, req.params.id]
        );
        res.json({ message: 'Project updated successfully' });
    } catch (error) {
        res.status(500).json({ message: 'Server error', error: error.message });
    }
};

const deleteProject = async (req, res) => {
    try {
        // Verify ownership
        const [projects] = await db.query('SELECT client_id FROM projects WHERE id = ?', [req.params.id]);
        if (projects.length === 0) return res.status(404).json({ message: 'Project not found' });
        if (projects[0].client_id !== req.user.id) return res.status(403).json({ message: 'Not authorized' });

        await db.query('DELETE FROM projects WHERE id=?', [req.params.id]);
        res.json({ message: 'Project deleted successfully' });
    } catch (error) {
        res.status(500).json({ message: 'Server error', error: error.message });
    }
};

module.exports = { getProjects, getProjectById, createProject, updateProject, deleteProject };
