from process import Process
import random

processes = []
cid = 7  # Coordinator ID
coordinator = None  # Variable to store the coordinator for convinience

# Create the 8 processes and store them into array
for i in range(8):
    # Get a random wait time before checking whether the coordinator is still up
    wait_time = round(random.uniform(0, 3), 2)
    processes.append(Process(i, f'process{i}', wait_time))

# Start the process and link it to all other classes.
for idx, process in enumerate(processes):

    # Link the processes here because the class attribute is shared across instances of the class
    process.neighbours.append(process)

    # Initialize original coordinator
    if idx == cid:
        process.coordinator['obj'] = process
        coordinator = process


for idx, process in enumerate(processes):
    # Start process once everything is setup
    process.start()

print('\n')

# Stop the coordinator to trigger an election
coordinator.listening = False
