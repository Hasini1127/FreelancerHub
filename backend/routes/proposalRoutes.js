const express = require('express');
const { getProposalsForProject, submitProposal, updateProposalStatus, getFreelancerProposals, getClientProposals } = require('../controllers/proposalController');
const { protect, authorize } = require('../middleware/authMiddleware');

const router = express.Router();

router.get('/project/:projectId', protect, authorize('client'), getProposalsForProject);
router.get('/client', protect, authorize('client'), getClientProposals);
router.get('/my-proposals', protect, authorize('freelancer'), getFreelancerProposals);
router.post('/', protect, authorize('freelancer'), submitProposal);
router.put('/:id', protect, authorize('client'), updateProposalStatus);

module.exports = router;
