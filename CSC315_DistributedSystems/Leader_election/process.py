import threading
import time
import datetime


'''
Threads will be used to simulate the different processes
'''


class Process (threading.Thread):

    ''' our processes dictionary is a class attribute, not an instance attribute. Therefore it is shared among all instances of the class. '''
    # Dictionaries and arrays are shared across class instances
    neighbours = []
    coordinator = {'obj': None, 'election': False}

    def __init__(self, pid, name, wait_time):
        threading.Thread.__init__(self)
        self.pid = pid
        self.name = name
        self.wait_time = wait_time
        self.listening = True

    def run(self):
        print(f'{self.name} started successfully')

        while self.listening:
            # Wait some random amount of time then check whether the coordinator is still alive
            time.sleep(3 + self.wait_time)

            if self.coordinator['obj'].isAlive():
                pass
            else:
                if self.coordinator['election'] is False:
                    self.election()

    def election(self):

        global elect
        elect = None

        self.coordinator['election'] = True

        print(
            f'Election started by {self.pid} for processes {self.pid + 1} to {len(self.neighbours) - 1}')

        # Send election requests to processes of higher PID
        start = self.pid

        # Check whether processes are okay
        def probe(self):

            global elect

            print('')
            print(
                f'Election ongoing for processes {start} to {len(self.neighbours) - 1} ')

            for process in self.neighbours[start:]:
                if process.isAlive():
                    print(f'{process.name} OK')
                    elect = process
                else:
                    print(f'{process.name} Dead')

                time.sleep(1)

        while start < len(self.neighbours):
            probe(self)
            start += 1

        # Spacer
        print('')

        if elect:
            # The elected process becomes the coordinator
            self.coordinator['obj'] = elect
            self.coordinator['election'] = False  # Election stopped
            print(f'{elect.name} has won the election')

        else:
            print('No process was qualified to become coordinator')
            # Stop election and restart the algorithm
            self.coordinator['election'] = False
            print('Algorithm restarted')
