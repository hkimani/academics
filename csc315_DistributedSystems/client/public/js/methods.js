export default class Actions {
    constructor(socket) {
        this.socket = socket
    }

    receive(message, state, callBack, responseMessage) {
        state.messages.push(message)
        this.read(message, state)
        callBack(responseMessage)
    }

    read(message) {
        let newMessage = document.createElement('p');
        let output = document.getElementById('messages')
        newMessage.innerHTML = 'Question: ' + message;
        output.appendChild(newMessage)
    }

    write(message, socket) {

        let newMessage = document.createElement('li');
        let newResponse = document.createElement('li');
        let messageList = document.getElementById('messageList')

        socket.emit('newMessage', message, (response) => {
            newMessage.innerHTML = "me: " + message;
            newResponse.innerHTML = "sever: " + response;
            messageList.appendChild(newMessage)
            messageList.appendChild(newResponse)
        })
    }
}