// CreateSnippet.js
import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import axios from 'axios';

function CreateSnippet() {
  const [title, setTitle] = useState('');
  const [content, setContent] = useState('');
  const [language, setLanguage] = useState('');
  const navigate = useNavigate();

  const handleSubmit = (e) => {
    e.preventDefault();
    const snippet = { title, content, language };

    axios.post('/api/snippets', snippet)
      .then(response => {
        console.log('Snippet created:', response.data);
        navigate('/');
      })
      .catch(error => console.error('Error creating snippet:', error));
  };

  return (
    <div>
      <h2>Create a New Snippet</h2>
      <form onSubmit={handleSubmit}>
        <div>
          <label>Title:</label>
          <input
            type="text"
            value={title}
            onChange={(e) => setTitle(e.target.value)}
            required
          />
        </div>
        <div>
          <label>Content:</label>
          <textarea
            value={content}
            onChange={(e) => setContent(e.target.value)}
            required
          ></textarea>
        </div>
        <div>
          <label>Language:</label>
          <input
            type="text"
            value={language}
            onChange={(e) => setLanguage(e.target.value)}
            required
          />
        </div>
        <button type="submit">Create Snippet</button>
      </form>
    </div>
  );
}

export default CreateSnippet;
