const express = require('express');
const { getFreelancers, getFreelancerById, updateFreelancerProfile } = require('../controllers/freelancerController');
const { protect, authorize } = require('../middleware/authMiddleware');

const router = express.Router();

router.get('/', getFreelancers);
router.get('/:id', getFreelancerById);
router.put('/profile', protect, authorize('freelancer'), updateFreelancerProfile);

module.exports = router;
