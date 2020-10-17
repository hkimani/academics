module.exports = class Actions {
    constructor() { }

    receive(client) {
        client.on('newMessage', function (message, callBack) {
            callBack('Message received as: ' + message)
        })
    }

    write(client) {
        client.emit('question', 'are you there?', function (response) {
            console.log('Answer is: ', response)
        });
    }

    initiate(client) {
        let instance = this;
        var interval = setInterval(() => {
            instance.write(client)
        }, 2000);

        // Start sending messages
        client.on('start', () => {
            console.log('Questions restarted by client')
            interval = setInterval(() => {
                instance.write(client)
            }, 2000);
        })

        // Stop messages
        client.on('stop', () => {
            console.log('Questions stopped by client')
            clearInterval(interval)
            interval.refresh()
        })
    }
}