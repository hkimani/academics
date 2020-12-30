import datetime

locations = ['CBD', 'PKL', 'UON', 'WLD', 'KNH', 'NGN', 'KRN', 'SKM', 'NSD', 'APT']
routes = [
    ['CBD', 'PKL'],
    ['CBD', 'UON'],
    ['UON', 'WLD'],
    ['UON', 'KRN'],
    ['UON', 'NGN'],
    ['NSD', 'PKL'],
    ['NSD', 'KNH'],
    ['NSD', 'SKM'],
    ['NSD', 'APT'],
    ['APT', 'SKM'],
]

# Best route
complete = False;

# Adjacency list to hold the nodes and edges
adjacencyList = {}

# Update nodes to the adjacency list
def addNode(location):
    adjacencyList[location] = []

# Update the edges
def addEdge(origin, destination):
    adjacencyList[origin].append(destination)
    adjacencyList[destination].append(origin)

for location in locations:
    addNode(location)

for route in routes:
    addEdge(route[0], route[1])

# View the adjacency list
# print(adjacencyList)
# print('')

# Depth first search algorithm
def dfs(start, destination, visited = set(())):
    global complete

    # Check if search completed
    if complete:
        return

    # Check if we've arrived
    if start == destination:
        print(f'{destination} reached')
        complete = True
        return

    # Print where we are
    print(start)

    # Mark current location as visited
    visited.add(start)

    # Get neighbours
    neighbours = adjacencyList[start]

    # Visit neighbours
    for neighbour in neighbours:
        neighbour_not_visited = neighbour not in visited
        if neighbour_not_visited:
            dfs(neighbour, destination, visited)
        
    return


start_time = datetime.datetime.now()

# Set start and destination
dfs('APT', 'WLD') # Find if a route from the Airport to Westlands exists

finish_time = datetime.datetime.now()

delta = finish_time - start_time

print('')
print(f'Total time taken is {delta.total_seconds() * 1000} milliseconds')
    