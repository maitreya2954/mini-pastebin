import React, { useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';
import axios from 'axios';
import './SnippetDetail.scss'; // Import the SCSS file

function SnippetDetail() {
  const { id } = useParams();
  const [snippet, setSnippet] = useState(null);

  useEffect(() => {
    axios.get(`/api/snippets/${id}`)
      .then(response => setSnippet(response.data))
      .catch(error => console.error('Error fetching snippet:', error));
  }, [id]);

  if (!snippet) return <div>Loading...</div>;

  return (
    <div className="snippet-detail-container">
      <h2 className="snippet-title">{snippet.title}</h2>
      <pre className="snippet-content">{snippet.content}</pre>
      <p className="snippet-language"><span className="snippet-label">Language:</span> {snippet.language}</p>
      {/* <div className="snippet-info">
        <span>Created: {new Date(snippet.createdAt).toLocaleDateString()}</span>
        <span>Updated: {new Date(snippet.updatedAt).toLocaleDateString()}</span>
      </div> */}
    </div>
  );
}

export default SnippetDetail;
