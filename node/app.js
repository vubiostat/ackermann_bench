const express = require('express')
const app = express()
const port = 8000

const ack = (m, n) => {
  if (m === 0) {
     return n + 1
  }
  if (n === 0) {
     return ack((m - 1), 1);
  }
  return ack((m - 1), ack(m, (n - 1)))
}

app.get('/', (req, res) => {
  const { m, n } = req.query;
  if (!(m && n && isFinite(m) && isFinite(n))) {
    res.send('')
    return;
  }
  res.send(
    ack(
      parseInt(m),
      parseInt(n))
    .toString());
})

app.listen(port, () => {
  console.log(`app listening on port ${port}`)
})
