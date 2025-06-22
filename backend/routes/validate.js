const express = require('express');
const router = express.Router();
const { validateVHDL } = require('../controllers/validateController');

router.post('/', validateVHDL);

module.exports = router;