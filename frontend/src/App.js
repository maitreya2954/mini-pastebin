import React from 'react';
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import Home from './components/Home/Home';
import SnippetDetail from './components/SnippetDetail';
import CreateSnippet from './components/CreateSnippet/CreateSnippet';
import Navbar from './components/Navbar/Navbar';
import './App.css';

function App() {
    return (
        <Router>
            <div className="App">
                <Navbar />
                <Routes>
                    <Route path="/" element={<Home />} />
                    <Route path="/snippet/:id" element={<SnippetDetail />} />
                    <Route path="/create" element={<CreateSnippet />} />
                </Routes>
            </div>
        </Router>
    );
}

export default App;
