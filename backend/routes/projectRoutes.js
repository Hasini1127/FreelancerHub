const express = require('express');
const { getProjects, getProjectById, createProject, updateProject, deleteProject } = require('../controllers/projectController');
const { protect, authorize } = require('../middleware/authMiddleware');

const router = express.Router();

router.get('/', getProjects);
router.get('/:id', getProjectById);
router.post('/', protect, authorize('client'), createProject);
router.put('/:id', protect, authorize('client'), updateProject);
router.delete('/:id', protect, authorize('client'), deleteProject);

module.exports = router;
