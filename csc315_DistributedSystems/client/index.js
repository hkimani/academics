const express = require('express')
const path = require('path')
const app = express()
const port = 2021;

app.use(express.static(path.join(__dirname, 'public')))
app.use('/socket.io-client', express.static(__dirname + '/node_modules/socket.io-client/dist/')); // redirect Socket-io

// Serve
app.listen(port, () => {
    console.log(`Listening at http://localhost:${port}`)
})
