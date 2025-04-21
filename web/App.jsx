import React, { useState } from 'react';
import axios from 'axios';

function App() {
  const [question, setQuestion] = useState('');
  const [result, setResult] = useState([]);

  const askQuestion = async () => {
    const res = await axios.post('/ask', { question });
    setResult(res.data.data);
  };

  return (
    <div style={{ padding: '2rem', fontFamily: 'sans-serif' }}>
      <h1>AdventureWorks AI Assistant</h1>
      <input value={question} onChange={e => setQuestion(e.target.value)} style={{ width: '60%' }} />
      <button onClick={askQuestion}>Ask</button>

      <pre>{JSON.stringify(result, null, 2)}</pre>
    </div>
  );
}

export default App;
