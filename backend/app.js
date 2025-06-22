const express = require('express');
const app = express();
const cors = require('cors');
const snippetsRoutes = require('./routes/snippets');
const validateRoutes = require('./routes/validate');

app.use(cors());
app.use(express.json());

app.use('/api/snippets', snippetsRoutes);
app.use('/api/validate', validateRoutes);

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));