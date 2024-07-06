// routes/snippetRoutes.js
const express = require('express');
const router = express.Router();
const { createSnippet, getSnippets, getSnippet, updateSnippet, deleteSnippet } = require('../controllers/snippetController');

// Define routes
router.post('/snippets', createSnippet);
router.get('/snippets', getSnippets);
router.get('/snippets/:id', getSnippet);
router.put('/snippets/:id', updateSnippet);
router.delete('/snippets/:id', deleteSnippet);

module.exports = router;
