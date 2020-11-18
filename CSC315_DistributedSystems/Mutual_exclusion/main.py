from process import Process
import random

no_of_process = 8
processes = []
head = None

# Create the processes
for i in range(no_of_process):
    # Get a random sleep time before checking whether i have the token
    sleep_time = round(random.uniform(0, 3), 2)

    p = Process(i, f'process {i}', sleep_time)

    processes.append(p)

# Assign neighbours to the processes
for idx, process in enumerate(processes):

    if idx == 0:
        head = process

    if idx == (no_of_process - 1):
        process.neighbour = head
    else:
        process.neighbour = processes[idx + 1]

# Confirm that the ring is correct
print('Process confirmation: ... \n')
for process in processes:
    print(f"{process.name} -> neighbour: {process.neighbour.name}")

print('')

# Start the token ring
print('Starting the processes ... \n')
for process in processes:
    process.start()

#  Push token to head
head.token_queue.append('token')
print('Token pushed to the head \n')
