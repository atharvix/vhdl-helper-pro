const { exec } = require('child_process');

exports.runGHDL = (filePath) => {
  return new Promise((resolve) => {
    exec(`ghdl -s ${filePath} && ghdl -a ${filePath}`, (error, stdout, stderr) => {
      if (error) return resolve(stderr);
      return resolve('✅ VHDL code is syntactically valid.');
    });
  });
};
