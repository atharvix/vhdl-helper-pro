require.config({ paths: { vs: 'monaco/min/vs' } });

require(['vs/editor/editor.main'], function () {
  // 1. Register VHDL as a new custom language
  monaco.languages.register({ id: 'vhdl' });

  // 2. Basic syntax highlighter for VHDL using Monarch
  monaco.languages.setMonarchTokensProvider('vhdl', {
    tokenizer: {
      root: [
        // Keywords
        [/\b(entity|architecture|begin|end|signal|process|if|then|else|elsif|when|others|port|in|out|std_logic|std_logic_vector|library|use|work|is|of|map|with|select|generate|generic|for|loop|wait|on|rising_edge|falling_edge|report|severity)\b/, 'keyword'],

        // Numbers
        [/\b\d+\b/, 'number'],

        // Strings
        [/".*?"/, 'string'],

        // Comments
        [/--.*/, 'comment'],

        // Identifiers
        [/[a-zA-Z_]\w*/, 'identifier'],

        // Operators and punctuation
        [/[:=><+\-*/&|]/, 'operator']
      ]
    }
  });

  // 3. Optional: Language configuration (auto-close brackets, comments)
  monaco.languages.setLanguageConfiguration('vhdl', {
    comments: {
      lineComment: '--'
    },
    autoClosingPairs: [
      { open: '"', close: '"' },
      { open: '(', close: ')' }
    ],
    brackets: [['begin', 'end'], ['(', ')']]
  });

  // 4. Create the Monaco Editor
  window.editor = monaco.editor.create(document.getElementById('editor'), {
    value: `-- Write your VHDL code here\n\nentity test is\nend test;`,
    language: 'vhdl',
    theme: 'vs-dark',
    automaticLayout: true
  });

  // 5. Load snippets based on dropdown
  document.getElementById('loadSnippet').addEventListener('click', function () {
    const category = document.getElementById('categorySelect').value;
    const snippets = {
      mux: `-- 2-to-1 Multiplexer\nentity mux is\n  Port ( a : in std_logic;\n         b : in std_logic;\n         sel : in std_logic;\n         y : out std_logic);\nend mux;\n\narchitecture Behavioral of mux is\nbegin\n  y <= a when sel = '0' else b;\nend Behavioral;`,
      decoder: `-- 2-to-4 Decoder\nentity decoder is\n  Port ( a : in std_logic_vector(1 downto 0);\n         y : out std_logic_vector(3 downto 0));\nend decoder;\n\narchitecture Behavioral of decoder is\nbegin\n  process(a)\n  begin\n    y <= "0001" when a = "00" else\n         "0010" when a = "01" else\n         "0100" when a = "10" else\n         "1000";\n  end process;\nend Behavioral;`
      // Add more as needed
    };

    if (snippets[category]) {
      window.editor.setValue(snippets[category]);
    } else {
      alert("No snippet available for this category.");
    }
  });

  // 6. Reset editor button
  document.getElementById('resetEditor').addEventListener('click', () => {
    window.editor.setValue('-- Write your VHDL code here\n');
  });

  // 7. Run simulation - send code to backend
  document.getElementById('runCode').addEventListener('click', () => {
    const code = window.editor.getValue();
    fetch('/run-vhdl', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ code: code })
    })
      .then(res => res.json())
      .then(data => {
        document.getElementById('output').textContent = data.output;
      })
      .catch(err => {
        document.getElementById('output').textContent = "Error: " + err;
      });
  });
});
