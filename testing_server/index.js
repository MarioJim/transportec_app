const path = require('path');
const express = require('express');
const app = express();

app.post('/', (req, res) => {
  const idx = Math.floor(58 * Math.random());
  const filepath = path.join(__dirname, `requests/resp${idx}.txt`);
  console.log(`Serving file "${filepath}"`);
  res.sendFile(filepath);
});

app.listen(8080, () => {
  console.log('App listening on port 8080');
});
