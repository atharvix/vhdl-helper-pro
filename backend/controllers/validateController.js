const fs = require('fs');
const path = require('path');
const { runGHDL } = require('../utils/runGHDL');

exports.validateVHDL = async (req, res) => {
  const code = req.body.code;
  const filePath = path.join(__dirname, '../test_files/user_code.vhdl');
  fs.writeFileSync(filePath, code);
  const output = await runGHDL(filePath);
  res.send(output);
};