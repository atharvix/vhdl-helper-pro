const fs = require('fs');
const path = require('path');

const snippetsPath = path.join(__dirname, '../../frontend-react/snippets');

exports.getSnippetFolders = (req, res) => {
  function getFilesRecursive(dir, base = '') {
    let results = [];
    fs.readdirSync(dir).forEach(file => {
      const fullPath = path.join(dir, file);
      const relPath = base ? path.join(base, file) : file;
      if (fs.statSync(fullPath).isDirectory()) {
        results = results.concat(getFilesRecursive(fullPath, relPath));
      } else if (file.endsWith('.vhdl')) {
        results.push(relPath.replace(/\\/g, '/')); // Use forward slashes for frontend
      }
    });
    return results;
  }

  const categories = fs.readdirSync(snippetsPath).filter(f => 
    fs.statSync(path.join(snippetsPath, f)).isDirectory()
  );
  const result = categories.map(category => {
    const files = getFilesRecursive(path.join(snippetsPath, category));
    return { category, files };
  });
  res.json(result);
};

exports.getSnippetFile = (req, res) => {
  const { category } = req.params;
  const filename = req.params[0]; // wildcard part after /:category/
  const filePath = path.join(snippetsPath, category, filename);
  if (fs.existsSync(filePath)) {
    const code = fs.readFileSync(filePath, 'utf8');
    res.send(code);
  } else {
    res.status(404).send('File not found');
  }
};