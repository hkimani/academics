import methods from "./methods.js"

// Initialize response message
let input = document.getElementById('ackmessage');
let inputForm = document.getElementById('msgForm');
let sendForm = document.getElementById('sendForm');
let sendFormInput = document.getElementById('sendMessage');
let messageElement = document.getElementById('msg');
let button = document.getElementById('btn');
let buttonStart = document.getElementById('btnStart');
let buttonClear = document.getElementById('btnClear');
let outputElement = document.getElementById('messages')
let statusElement = document.getElementById('listenStatus');
let status = true;
var socket = io('http://localhost:2020');
var state = {
    messages: []
};
var actions = new methods(socket); // Actions instance

let responseMessage = messageElement.innerHTML;

// When stop button is clicked
button.addEventListener("click", (event) => {
    if (status === true) {
        stopMessages()
    }
})

// When start button is clicked
buttonStart.addEventListener("click", (event) => {
    if (status !== true) {
        startMessages()
    }
})

// Clear messages
buttonClear.addEventListener("click", (event) => {
    outputElement.innerHTML = ""
})

// Prevent page from reloading
inputForm.addEventListener('submit', (event) => {
    event.preventDefault()
});

// Update response message
input.addEventListener('input', (event) => {
    messageElement.innerHTML = event.target.value;
    responseMessage = messageElement.innerHTML;
});

// Send message
sendForm.addEventListener('submit', (event) => {
    event.preventDefault()
    actions.write(sendFormInput.value, socket)
})


socket.on('connect', () => {
    console.log(socket.connected); // true
});

socket.on('disconnect', () => {
    console.log(socket.connected); // false
});

socket.on('question', (question, callBack) => {
    actions.receive(question, state, callBack, responseMessage)
})

// Tell server to stop sending messages
function stopMessages() {
    socket.emit('stop')
    statusElement.innerHTML = "Stopped"
    status = false;
    actions.read("Stopped")
}

// Tell server to start sending messages
function startMessages() {
    socket.emit('start')
    statusElement.innerHTML = "Listening"
    status = true;
    actions.read("Listening")
}
