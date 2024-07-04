// Home.js
import React, { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import axios from 'axios';
import './Home.scss'

function Home() {
  const [snippets, setSnippets] = useState([]);

  useEffect(() => {
    axios.get('/api/snippets')
      .then(response => setSnippets(response.data))
      .catch(error => console.error('Error fetching snippets:', error));
  }, []);

  return (
    <div>
      <h2>All Snippets</h2>
      <ul>
        {snippets.map(snippet => (
          <li key={snippet.id}>
            <Link to={`/snippet/${snippet.id}`}>{snippet.title}</Link>
          </li>
        ))}
      </ul>
    </div>
  );
}

export default Home;
