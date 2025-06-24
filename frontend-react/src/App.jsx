import { useState, useEffect } from 'react';
import MonacoEditor from '@monaco-editor/react';

import playIcon from './assets/8bit/play.svg';
import refreshIcon from './assets/8bit/refresh.svg';
import folderIcon from './assets/8bit/folder.svg';
import wrenchIcon from './assets/8bit/wrench.svg';

const API_BASE = 'http://localhost:3000/api';

function App() {
  const [categories, setCategories] = useState([]);
  const [hoveredCategory, setHoveredCategory] = useState(null);
  const [hoveredSubcategory, setHoveredSubcategory] = useState(null);
  const [subcategories, setSubcategories] = useState([]);
  const [snippets, setSnippets] = useState([]);
  const [code, setCode] = useState('-- Write your VHDL code here\n');
  const [output, setOutput] = useState('');
  const [loading, setLoading] = useState(false);

  // Fetch snippet categories and files
  useEffect(() => {
    fetch(`${API_BASE}/snippets`)
      .then(res => res.json())
      .then(data => setCategories(data))
      .catch(() => setCategories([]));
  }, []);

  // Update subcategories when hoveredCategory changes
  useEffect(() => {
    setHoveredSubcategory(null);
    setSubcategories([]);
    setSnippets([]);
    if (!hoveredCategory) return;
    const cat = categories.find(c => c.category === hoveredCategory);
    if (!cat) return;
    // Extract subcategories from file paths
    const subcatSet = new Set();
    cat.files.forEach(f => {
      const parts = f.split('/');
      if (parts.length > 1) subcatSet.add(parts[0]);
      else subcatSet.add('uncategorized');
    });
    setSubcategories(Array.from(subcatSet));
  }, [hoveredCategory, categories]);

  // Update snippets when hoveredSubcategory changes
  useEffect(() => {
    setSnippets([]);
    if (!hoveredCategory || !hoveredSubcategory) return;
    const cat = categories.find(c => c.category === hoveredCategory);
    if (!cat) return;
    // Filter files for selected subcategory
    const filtered = cat.files.filter(f => {
      const parts = f.split('/');
      if (hoveredSubcategory === 'uncategorized') {
        return parts.length === 1;
      } else {
        return parts[0] === hoveredSubcategory;
      }
    }).map(f => (hoveredSubcategory === 'uncategorized' ? f : f.split('/').slice(1).join('/')));
    setSnippets(filtered);
  }, [hoveredCategory, hoveredSubcategory, categories]);

  // Load snippet code
  const handleSnippetClick = (category, subcategory, snippet) => {
    const filename = subcategory === 'uncategorized' ? snippet : `${subcategory}/${snippet}`;
    fetch(`${API_BASE}/snippets/${category}/${filename}`)
      .then(res => res.text())
      .then(setCode)
      .catch(() => setCode('-- Error loading snippet --'));
    // Close all menus after selection
    setHoveredCategory(null);
    setHoveredSubcategory(null);
  };

  // Run VHDL code
  const runCode = async () => {
    setLoading(true);
    setOutput('');
    try {
      const res = await fetch(`${API_BASE}/validate`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ code })
      });
      const text = await res.text();
      setOutput(text);
    } catch (err) {
      setOutput('Error: ' + err);
    }
    setLoading(false);
  };

  return (
    <div className="vhdl-helper-container">
      <header>
        <h1><img className="pixel-icon" src={wrenchIcon} alt="logo" />VHDL Helper Pro</h1>
        <p>Your ultimate VHDL learning and simulation assistant (React + Vite)</p>
        <nav className="pixel-menu">
          {categories.map(cat => (
            <div
              key={cat.category}
              className="pixel-menu-category"
              onMouseEnter={() => setHoveredCategory(cat.category)}
              onMouseLeave={() => { setHoveredCategory(null); setHoveredSubcategory(null); }}
            >
              <img className="pixel-icon" src={folderIcon} alt="category" />{cat.category}
              {hoveredCategory === cat.category && subcategories.length > 0 && (
                <div className="pixel-menu-subcat-dropdown">
                  {subcategories.map(subcat => (
                    <div
                      key={subcat}
                      className="pixel-menu-subcat"
                      onMouseEnter={() => setHoveredSubcategory(subcat)}
                      onMouseLeave={() => setHoveredSubcategory(null)}
                    >
                      {subcat}
                      {hoveredSubcategory === subcat && snippets.length > 0 && (
                        <div className="pixel-menu-snippet-dropdown">
                          {snippets.map(snippet => (
                            <div
                              key={snippet}
                              className="pixel-menu-snippet"
                              onClick={() => handleSnippetClick(cat.category, subcat, snippet)}
                            >
                              {snippet}
                            </div>
                          ))}
                        </div>
                      )}
                    </div>
                  ))}
                </div>
              )}
            </div>
          ))}
        </nav>
      </header>
      <main>
        <section className="editor-panel">
          <button className="pixel-btn" onClick={() => setCode('-- Write your VHDL code here\n')}>
            <img className="pixel-icon" src={refreshIcon} alt="reset" />Reset
          </button>
          <button className="pixel-btn" onClick={runCode} disabled={loading}>
            <img className="pixel-icon" src={playIcon} alt="run" />Run
          </button>
        </section>
        <section className="editor-container-wide pixel-border pixel-panel">
          <MonacoEditor
            height="400px"
            defaultLanguage="vhdl"
            value={code}
            onChange={value => setCode(value)}
            theme="vs-dark"
            options={{ fontSize: 16 }}
          />
        </section>
        <section className="pixel-output">
          <h2>Output</h2>
          <pre id="output">{loading ? 'Running...' : output}</pre>
        </section>
      </main>
      <footer>
        <p>&copy; 2025 VHDL Helper Pro | Built by ATHARV MEHROTRA for learners</p>
      </footer>
    </div>
  );
}

export default App;
