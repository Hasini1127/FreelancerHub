const db = require('../config/db');

const getProposalsForProject = async (req, res) => {
    try {
        const [proposals] = await db.query(`
            SELECT p.*, u.name as freelancer_name 
            FROM proposals p 
            JOIN users u ON p.freelancer_id = u.id 
            WHERE p.project_id = ?
        `, [req.params.projectId]);
        res.json(proposals);
    } catch (error) {
        res.status(500).json({ message: 'Server error', error: error.message });
    }
};

const submitProposal = async (req, res) => {
    try {
        const { project_id, cover_letter, bid_amount, delivery_days } = req.body;
        
        const [result] = await db.query(
            'INSERT INTO proposals (project_id, freelancer_id, cover_letter, bid_amount, delivery_days) VALUES (?, ?, ?, ?, ?)',
            [project_id, req.user.id, cover_letter, bid_amount, delivery_days]
        );
        res.status(201).json({ message: 'Proposal submitted successfully', proposalId: result.insertId });
    } catch (error) {
        if (error.code === 'ER_DUP_ENTRY') {
            return res.status(400).json({ message: 'You have already submitted a proposal for this project' });
        }
        res.status(500).json({ message: 'Server error', error: error.message });
    }
};

const updateProposalStatus = async (req, res) => {
    try {
        const { status } = req.body;
        // Verify client owns the project
        const [proposals] = await db.query('SELECT project_id FROM proposals WHERE id = ?', [req.params.id]);
        if (proposals.length === 0) return res.status(404).json({ message: 'Proposal not found' });

        const [projects] = await db.query('SELECT client_id FROM projects WHERE id = ?', [proposals[0].project_id]);
        if (projects[0].client_id !== req.user.id) return res.status(403).json({ message: 'Not authorized' });

        await db.query('UPDATE proposals SET status = ? WHERE id = ?', [status, req.params.id]);
        res.json({ message: 'Proposal updated successfully' });
    } catch (error) {
        res.status(500).json({ message: 'Server error', error: error.message });
    }
};

const getFreelancerProposals = async (req, res) => {
    try {
        const [proposals] = await db.query(`
            SELECT p.*, pr.title as project_title, pr.status as project_status 
            FROM proposals p 
            JOIN projects pr ON p.project_id = pr.id 
            WHERE p.freelancer_id = ?
        `, [req.user.id]);
        res.json(proposals);
    } catch (error) {
        res.status(500).json({ message: 'Server error', error: error.message });
    }
};

const getClientProposals = async (req, res) => {
    try {
        const [proposals] = await db.query(`
            SELECT p.*, pr.title as project_title, pr.status as project_status, u.name as freelancer_name 
            FROM proposals p 
            JOIN projects pr ON p.project_id = pr.id 
            JOIN users u ON p.freelancer_id = u.id
            WHERE pr.client_id = ?
            ORDER BY p.created_at DESC
        `, [req.user.id]);
        res.json(proposals);
    } catch (error) {
        res.status(500).json({ message: 'Server error', error: error.message });
    }
};

module.exports = { getProposalsForProject, submitProposal, updateProposalStatus, getFreelancerProposals, getClientProposals };
