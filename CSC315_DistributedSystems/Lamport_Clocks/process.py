import time

import multiprocessing


class CustomProcess:

    def __init__(self, name):
        self.clock = 0
        self.name = name
        self.active = True
        self.listener_interval = 0.20
        self.event_queue = multiprocessing.Queue()

    def listen(self):  # Event listener
        print(
            f'{self.name} is listening for events every {self.listener_interval} seconds')

        while self.active:
            time.sleep(self.listener_interval)

            while self.event_queue.empty() is False:
                event = self.event_queue.get()
                sender_clock = event['clock']
                self.receive_message(sender_clock)
                print(
                    f'{self.name} received {event["name"]} at LAMPORT TIME: {self.clock}')
                print('\n')

    def receive_message(self, sender_clock):
        my_clock = max(sender_clock, self.clock) + 1
        self.clock = my_clock

    def send_message(self, process, event):
        process.add_event(event)
        print(f'Message sent to {process.name} from {self.name}')

    def add_event(self, event):
        self.event_queue.put(event)
