const express = require('express');
const app = express();
const server = require('http').createServer(app);
const port = 2020;

// Socket actions class
const socketActions = require('./controllers/socketActions')
actions = new socketActions()

const io = require('socket.io')(server);
io.on('connection', client => {

    actions.initiate(client) // Initialize the autonomous message to the client
    actions.receive(client) // Listen to messages from the client
});

server.listen(port, () => {
    console.log(`Listening at http://localhost:${port}`)
})
