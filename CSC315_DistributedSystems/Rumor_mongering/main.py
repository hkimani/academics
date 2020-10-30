from node import Node
import random

# Initialize the other nodes
P = Node("P")
Q = Node("Q")
R = Node("R")
S = Node("S")
T = Node("T")

# Create dictionary of nodes
newNodes = dict(Q=Q, R=R, S=S, T=T)

# Fully connected graph
P.create(newNodes)
Q.create(newNodes)
R.create(newNodes)
S.create(newNodes)
T.create(newNodes)

# Blind probability
P.infect("d1", "newValue")
P.blindProbabilityUpdate("d1", "newValue")

# q = random.choice(list(newNodes.items()))

# print(q[1])
