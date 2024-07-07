// server.js
const express = require('express');
const bodyParser = require('body-parser');
require('dotenv').config();
const snippetRoutes = require('./routes/snippetRoutes');
const sequelize = require('./config/database');

// Sync models and connect to the database
sequelize.sync().then(() => console.log('Database synced.'));

const app = express();
app.use(bodyParser.json());

// API routes
app.use('/api', snippetRoutes);

// Start the server
const PORT = process.env.PORT || 9999;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
