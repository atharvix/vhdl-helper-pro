# 🔧 VHDL Helper Pro

VHDL Helper Pro is a modern and beginner-friendly tool that helps students and engineers learn, edit, simulate, 
and test VHDL code right from the browser using Monaco Editor and a Node.js backend powered by GHDL.

---

## 📁 Project Structure

vhdl-helper-pro/

├── frontend/

│ ├── index.html # Main UI

│ ├── style.css # Basic styling

│ ├── script.js # Editor, snippet loader, and runner

│ ├── monaco/ # Monaco Editor scripts

│ └── snippets/ # Organized VHDL examples

│ ├── mux/

│ ├── decoder/

│ ├── encoder/

│ ├── flipflop/

│ ├── counter/

│ └── alu/

├── backend/

│ ├── app.js # Express backend

│ ├── package.json # Project metadata and dependencies

│ ├── routes/

│ │ ├── snippets.js # Route to serve VHDL files

│ │ └── validate.js # Route to run GHDL and return results

│ ├── controllers/

│ │ ├── snippetsController.js

│ │ └── validateController.js

│ ├── utils/runGHDL.js # Executes and returns GHDL output

│ └── test_files/

│ ├── user_code.vhdl

│ └── user_code_tb.vhdl # Temporary files for testing


---

## ⚙️ Features

- 🧠 60+ categorized VHDL snippets (MUX, Decoder, Encoder, Flip-Flop, Counter, ALU)
- 🎨 Monaco Editor integration with VHDL syntax highlighting
- ▶ Code simulation backend using GHDL
- 🔄 Reset, load, and run functionality
- 📦 Built with Node.js, Express, and GHDL

---

## 🚀 Getting Started

## 1. Clone this repo

git clone https://github.com/yourusername/vhdl-helper-pro.git

cd vhdl-helper-pro

## 2. Install backend dependencies

cd backend

npm install

## 3. Start the server

node app.js

## 4. Open the frontend

Open frontend/index.html in a browser (suggestion: use Live Server extension for VS Code).

---

## 🛠 Requirements

- Node.js
- GHDL installed and added to system path
- Browser (Chrome/Firefox)

---

## 👨‍💻 Contributors
**Atharv Mehrotra (atharvix)** – Full-stack Developer, Project Designer

## 📜 License
This project is licensed under the MIT License.

---
