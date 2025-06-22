const express = require('express');
const router = express.Router();
const { getSnippetFolders, getSnippetFile } = require('../controllers/snippetsController');

router.get('/', getSnippetFolders);
router.get('/:category/:filename', getSnippetFile);

module.exports = router;