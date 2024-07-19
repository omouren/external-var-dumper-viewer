const express = require('express')
const router = express.Router()

module.exports = io => {
  router.post('/', (req, res) => {
    io.sockets.emit('dump', req.body)
    res.send('ok')
  })

  return router
}