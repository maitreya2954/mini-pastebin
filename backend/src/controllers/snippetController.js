// controllers/snippetController.js
const Snippet = require('../models/Snippet');

// Create a new snippet
exports.createSnippet = async (req, res) => {
  const { title, content, language } = req.body;
  try {
    const snippet = await Snippet.create({ title, content, language });
    res.status(201).json(snippet);
  } catch (error) {
    res.status(500).json({ error: 'Unable to create snippet' });
  }
};

// Get all snippets
exports.getSnippets = async (req, res) => {
  try {
    const snippets = await Snippet.findAll();
    res.json(snippets);
  } catch (error) {
    res.status(500).json({ error: 'Unable to retrieve snippets' });
  }
};

// Get a specific snippet
exports.getSnippet = async (req, res) => {
  const { id } = req.params;
  try {
    const snippet = await Snippet.findByPk(id);
    if (snippet) {
      res.json(snippet);
    } else {
      res.status(404).json({ error: 'Snippet not found' });
    }
  } catch (error) {
    res.status(500).json({ error: 'Unable to retrieve snippet' });
  }
};

// Update a snippet
exports.updateSnippet = async (req, res) => {
  const { id } = req.params;
  const { title, content, language } = req.body;
  try {
    const snippet = await Snippet.findByPk(id);
    if (snippet) {
      await snippet.update({ title, content, language });
      res.json(snippet);
    } else {
      res.status(404).json({ error: 'Snippet not found' });
    }
  } catch (error) {
    res.status(500).json({ error: 'Unable to update snippet' });
  }
};

// Delete a snippet
exports.deleteSnippet = async (req, res) => {
  const { id } = req.params;
  try {
    const snippet = await Snippet.findByPk(id);
    if (snippet) {
      await snippet.destroy();
      res.status(204).json();
    } else {
      res.status(404).json({ error: 'Snippet not found' });
    }
  } catch (error) {
    res.status(500).json({ error: 'Unable to delete snippet' });
  }
};
