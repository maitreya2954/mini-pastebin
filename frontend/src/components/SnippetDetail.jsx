import React, { useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';
import axios from 'axios';

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
        <div>
            <h2>{snippet.title}</h2>
            <pre>{snippet.content}</pre>
            <p><strong>Language:</strong> {snippet.language}</p>
        </div>
    );
}

export default SnippetDetail;
