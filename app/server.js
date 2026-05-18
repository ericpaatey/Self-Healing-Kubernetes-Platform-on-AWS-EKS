const express = require('express');

const app = express();

app.get('/', (req, res) => {
  res.send('EKS Self-Healing Platform Running');
});

app.get('/health', (req, res) => {
  res.status(200).send('OK');
});

/*
Simulate crash
*/
app.get('/crash', (req, res) => {
  process.exit(1);
});

app.listen(3000, () => {
  console.log('Server running on port 3000');
});