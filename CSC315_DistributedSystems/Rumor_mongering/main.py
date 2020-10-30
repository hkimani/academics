from node import Node
import random

# Initialize the other nodes
P = Q = R = S = T = None


def resetNodes():
    global P, Q, R, S, T

    # Initialize the other nodes
    P = Node("P")
    Q = Node("Q")
    R = Node("R")
    S = Node("S")
    T = Node("T")

    # Create dictionary of nodes
    newNodes = dict(P=P, Q=Q, R=R, S=S, T=T)

    # Fully connected graph
    P.create(newNodes)
    Q.create(newNodes)
    R.create(newNodes)
    S.create(newNodes)
    T.create(newNodes)

    return


# Blind probability
resetNodes()
print("Blind probability start")
P.infect("d1", "newValue")  # Infect a new node 'P'
P.blindProbabilityUpdate("d1", "newValue")

# Feedback based probability start
print("\n")
resetNodes()  # Re-initialize nodes
print("Feedback-based probability start")
Q.infect("d1", "newValue")  # Infect a new node 'Q'
Q.feedbackBasedUpdate("d1", "newValue")

# Fixed probability start
print("\n")
resetNodes()  # Re-initialize nodes
print("Fixed probability start")
S.infect("d1", "newValue")  # Infect a new node 'S'
S.fixedProbabilityUpdate("d1", "newValue")

# q = random.choice(list(newNodes.items()))

# print(q[1])
