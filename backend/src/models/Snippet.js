// models/Snippet.js
const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const Snippet = sequelize.define('Snippet', {
  title: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  content: {
    type: DataTypes.TEXT,
    allowNull: false,
  },
  language: {
    type: DataTypes.STRING,
    allowNull: false,
  }
});

module.exports = Snippet;
