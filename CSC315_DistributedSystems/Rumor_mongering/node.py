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

                q = random.choice(list(self.nodeList.items()))
                q = q[1]
                q.updateValue("d1", value)

                # Probability 0.3
                coinToss = random.choice([True, True, False])

                if coinToss:
                    self.state = "removed"
                    self.looping = False
                    print("Node: " + self.name +
                          " lost interest and is removed")
                    return
            else:
                self.looping = False
                return

    def feddbackBasedUpdate(self, keyname, value):
        pass

    def fixedProbability(self, keyname, value):
        pass

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

    def push(self):
        pass
