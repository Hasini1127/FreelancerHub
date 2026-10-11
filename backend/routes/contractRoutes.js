const express = require('express');
const { createOffer, getIncomingOffers, getClientOffers, updateOfferStatus } = require('../controllers/contractController');
const { protect, authorize } = require('../middleware/authMiddleware');

const router = express.Router();

router.post('/offer', protect, authorize('client'), createOffer);
router.get('/incoming', protect, authorize('freelancer'), getIncomingOffers);
router.get('/client', protect, authorize('client'), getClientOffers);
router.put('/:id/status', protect, updateOfferStatus);

module.exports = router;
