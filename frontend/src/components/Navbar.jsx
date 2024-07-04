// Navbar.js
import React from 'react';
import { Link } from 'react-router-dom';
import './Navbar.scss'

function Navbar() {
  return (
    <nav>
      <h2>Mini Pastebin</h2>
      <ul>
        <li><Link to="/">Home</Link></li>
        <li><Link to="/create">Create Snippet</Link></li>
      </ul>
    </nav>
  );
}

export default Navbar;
