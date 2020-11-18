import threading
import time
import datetime


class Process(threading.Thread):

    # Shared resource
    critical_section = {'key': 'value', 'timestamp': None}

    def __init__(self, pid, name, sleep_time):
        # Inherit from the threading class
        threading.Thread.__init__(self)
        self.pid = pid
        self.name = name
        self.listening = True
        self.token_queue = []
        self.neighbour = None
        self.sleep_time = sleep_time
        self.rounds = 0
        self.max_rounds = 3

    def run(self):
        while self.listening:
            if self.token_queue:
                # If the process has the token
                self.token_queue
                self.critical_section['timestamp'] = datetime.datetime.now()
                print(
                    f"Critical section accessed on {self.critical_section['timestamp']} by {self.name}")

                if self.neighbour:
                    self.neighbour.token_queue.append(self.token_queue.pop(0))
                    print(f'Token passed to {self.neighbour.name} \n')
                    self.rounds += 1

                    if self.rounds >= self.max_rounds:
                        self.listening = False
                        print(
                            f"{self.name} stopped after {self.rounds} rounds \n")
                else:
                    print('Neighbour unknown. Stopping the process')
                    self.listening = False

            else:
                # If the process doesn't have the token
                pass

            # wait some amount of time before trying to access the CS (crtical section)
            time.sleep(1 + self.sleep_time)
