from process import CustomProcess
from multiprocessing import Process
import random
import time

# Create the processes
process1 = CustomProcess('Process 1')
process2 = CustomProcess('Process 2')
process3 = CustomProcess('Process 3')

processes = [process1, process2, process3]

if __name__ == '__main__':
    print('Processes are starting ...')
    print('\n')

    # Activate the processes
    P1 = Process(target=process1.listen)
    P1.start()
    P2 = Process(target=process2.listen)
    P2.start()
    P3 = Process(target=process3.listen)
    P3.start()

    # Give some time to the process to finish starting
    time.sleep(2.5)
    print('\n')

    # Generate 30 events. Which will be triggering send and receive
    for e in range(30):
        random_sender = random.choice(processes)
        random_receiver = random.choice(processes)

        random_sender.send_message(
            random_receiver, {"name": f"Event {e}", "clock": random_sender.clock})

        time.sleep(0.5)

    # When finished terminate the program
    P1.terminate()
    P2.terminate()
    P3.terminate()
