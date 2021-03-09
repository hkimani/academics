from module import lib
import numpy as np


def execute(algorithm, test_inputs, inputs, labels):

    # Train the perceptron
    algorithm.train(inputs, labels)

    for i in test_inputs:
        # Test the perceptron
        print(algorithm.predict(i))


def import_heart_data():
    file = open('data/heart.data.txt', 'r')
    lines = file.readlines()

    input_list = []
    training_inputs = []
    labels = []

    # Strips the newline character
    for idx, line in enumerate(lines):

        # Remove trailing spaces
        new_line = line.strip()

        # Convert string to float and create new list
        new_list = [float(i) for i in new_line.split(' ')]

        # Add to master list
        input_list.append(new_list)
        # print("Line{}: {}".format(idx + 1, line.strip()))

    # Generate inputs and labels
    for lst in input_list:
        # Everything except last item of array
        training_inputs.append(lst[:-1])

        # Last item of the array
        labels.append(lst[-1])

    return training_inputs, labels


# Raw
training_inputs, labels = import_heart_data()

# Training inputs
inputs = []

# Adding training inputs
inputs.append(np.array([1, 1]))
inputs.append(np.array([1, 0]))
inputs.append(np.array([0, 1]))
inputs.append(np.array([0, 0]))

# Labels
labels = np.array([1, 0, 0, 0])
