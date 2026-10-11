const db = require('../config/db');

// Client creates an offer (contract) for a freelancer
const createOffer = async (req, res) => {
    try {
        const { freelancer_id, project_title, description, budget, start_date, deadline } = req.body;
        
        const [projectResult] = await db.query(
            'INSERT INTO projects (client_id, title, description, category, budget, deadline, experience_level, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?)',
            [req.user.id, project_title, description, 'Direct Offer', budget, deadline, 'Any', 'Under Review']
        );
        const projectId = projectResult.insertId;

        const [contractResult] = await db.query(
            'INSERT INTO contracts (project_id, client_id, freelancer_id, agreed_amount, start_date, deadline, status) VALUES (?, ?, ?, ?, ?, ?, ?)',
            [projectId, req.user.id, freelancer_id, budget, start_date, deadline, 'Pending']
        );

        res.status(201).json({ message: 'Project offer sent successfully', contractId: contractResult.insertId });
    } catch (error) {
        res.status(500).json({ message: 'Server error', error: error.message });
    }
};

const getIncomingOffers = async (req, res) => {
    try {
        const [contracts] = await db.query(`
            SELECT c.*, p.title as project_title, p.description, u.name as client_name
            FROM contracts c
            JOIN projects p ON c.project_id = p.id
            JOIN users u ON c.client_id = u.id
            WHERE c.freelancer_id = ?
        `, [req.user.id]);
        res.json(contracts);
    } catch (error) {
        res.status(500).json({ message: 'Server error', error: error.message });
    }
};

const getClientOffers = async (req, res) => {
    try {
        const [contracts] = await db.query(`
            SELECT c.*, p.title as project_title, u.name as freelancer_name
            FROM contracts c
            JOIN projects p ON c.project_id = p.id
            JOIN users u ON c.freelancer_id = u.id
            WHERE c.client_id = ?
        `, [req.user.id]);
        res.json(contracts);
    } catch (error) {
        res.status(500).json({ message: 'Server error', error: error.message });
    }
};

const updateOfferStatus = async (req, res) => {
    try {
        const { status } = req.body;
        const [contracts] = await db.query('SELECT * FROM contracts WHERE id = ?', [req.params.id]);
        if (contracts.length === 0) return res.status(404).json({ message: 'Offer not found' });

        const contract = contracts[0];
        
        if (contract.freelancer_id !== req.user.id && contract.client_id !== req.user.id) {
            return res.status(403).json({ message: 'Not authorized' });
        }

        await db.query('UPDATE contracts SET status = ? WHERE id = ?', [status, req.params.id]);
        
        let projectStatus = 'Under Review';
        if (status === 'Accepted') projectStatus = 'In Progress';
        if (status === 'Rejected') projectStatus = 'Cancelled';
        if (status === 'Completed') projectStatus = 'Completed';
        if (status === 'Submitted') projectStatus = 'Submitted';
        
        await db.query('UPDATE projects SET status = ? WHERE id = ?', [projectStatus, contract.project_id]);

        res.json({ message: 'Offer status updated successfully' });
    } catch (error) {
        res.status(500).json({ message: 'Server error', error: error.message });
    }
};

module.exports = { createOffer, getIncomingOffers, getClientOffers, updateOfferStatus };
