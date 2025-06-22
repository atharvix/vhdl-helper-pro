const fs = require('fs');
const path = require('path');

const snippetsPath = path.join(__dirname, '../../frontend/snippets');

exports.getSnippetFolders = (req, res) => {
  const categories = fs.readdirSync(snippetsPath);
  const result = categories.map(category => {
    const files = fs.readdirSync(path.join(snippetsPath, category)).filter(file => file.endsWith('.vhdl'));
    return { category, files };
  });
  res.json(result);
};

exports.getSnippetFile = (req, res) => {
  const { category, filename } = req.params;
  const filePath = path.join(snippetsPath, category, filename);
  if (fs.existsSync(filePath)) {
    const code = fs.readFileSync(filePath, 'utf8');
    res.send(code);
  } else {
    res.status(404).send('File not found');
  }
};