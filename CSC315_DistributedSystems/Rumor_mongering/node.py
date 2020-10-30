# using time module
import time
import random


class Node:
    def __init__(self, name):

        # ts stores the time in seconds
        ts = time.time()
        self.database = {
            "d1": {
                "value": "data",
                "timestamp": ts
            }
        }
        self.name = name
        self.state = "susceptible"
        self.nodeList = None
        self.k = 5

    # Create the list of new nodes
    # ... every node knows every other node
    def create(self, nodes):
        self.nodeList = nodes

    def blindProbabilityUpdate(self, keyname, value):
        ts = time.time()
        looping = True

        while looping:
            self.timeout(0.5)

            if self.state == "infected":

                # q is the active node
                node = random.choice(list(self.nodeList.items()))
                node = node[1]
                node.updateValue("d1", value)

                # Probality 1/5
                # Probability 0.20.
                coinToss = random.choice([False, False, False, False, True, ])

                if coinToss:
                    self.state = "removed"
                    self.looping = False
                    print("Node: " + self.name +
                          " lost interest and is removed")
                    return
            else:
                self.looping = False
                return

    def feedbackBasedUpdate(self, keyname, value):
        ts = time.time()
        looping = True

        while looping:
            self.timeout(0.5)

            if self.state == "infected":

                node = random.choice(list(self.nodeList.items()))
                node = node[1]  # get the node
                nodeState = node.state  # Get the node state
                node.updateValue("d1", value)

                # Probality 1/5
                # Probability 0.20.
                coinToss = random.choice([False, False, False, False, True, ])

                # If site was already infected
                if nodeState == "infected" and coinToss:
                    self.state = "removed"
                    self.looping = False
                    print("Node: " + self.name +
                          " lost interest and is removed")
                    return
            else:
                print("Node not infected stopping")
                self.looping = False
                return

    def fixedProbabilityUpdate(self, keyname, value):
        k = len(list(self.nodeList.keys()))
        ts = time.time()

        if self.state == "infected":

            # Go through all nodes and infect
            for node in list(self.nodeList.items()):
                self.timeout(0.5)
                node = node[1]
                node.updateValue("d1", value)
                if node.state == "infected":
                    print("Node " + node.name +
                          " is infected. Proceeding ...")

    def timeout(self, duration):
        time.sleep(duration)

    def infect(self, keyname, value):
        ts = time.time()
        self.state = "infected"
        self.database[keyname] = {
            "value": value,
            "timestamp": ts
        }
        print(self.name + " Infected")

    def updateValue(self, keyname, value):
        ts = time.time()
        if self.state == "susceptible":
            self.state = "infected"
            self.database[keyname] = {
                "value": value,
                "timestamp": ts
            }
            print(self.name + " updated")
            return
        else:
            return
