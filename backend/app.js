const express = require('express');
const cors = require('cors');
const authRoutes = require('./routes/authRoutes');
const projectRoutes = require('./routes/projectRoutes');
const proposalRoutes = require('./routes/proposalRoutes');
const freelancerRoutes = require('./routes/freelancerRoutes');
const contractRoutes = require('./routes/contractRoutes');

const path = require('path');

const app = express();

// Middleware
app.use(cors());
app.use(express.json());

// Serve frontend static files
app.use(express.static(path.join(__dirname, '../frontend')));

// Routes
app.use('/api/auth', authRoutes);
app.use('/api/projects', projectRoutes);
app.use('/api/proposals', proposalRoutes);
app.use('/api/freelancers', freelancerRoutes);
app.use('/api/contracts', contractRoutes);

// Global Error Handler
app.use((err, req, res, next) => {
    console.error(err.stack);
    res.status(500).json({ message: 'Internal server error', error: err.message });
});

module.exports = app;
