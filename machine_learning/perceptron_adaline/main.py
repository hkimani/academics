from module import lib
import numpy as np


def execute(algorithm, test_inputs, inputs, labels):

    # Train the perceptron
    algorithm.train(inputs, labels)

    for i in test_inputs:
        # Test the perceptron
        # print(algorithm.predict(i))
        algorithm.predict(i)


def import_heart_data():
    file = open('data/heart.data.txt', 'r')
    lines = file.readlines()

    input_list = []
    training_inputs = []
    labels = []
    training_inputs_final = []

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

    # Create compatible numpy array
    for idx, ipt in enumerate(training_inputs):
        training_inputs_final.append(np.array(ipt))

    # Labels
    new_labels = np.array(labels)

    return training_inputs_final, new_labels


training_inputs, labels = import_heart_data()
test_inputs = training_inputs

print('\nPerceptron algorithm\n')

perceptron = lib.Perceptron(13)
perceptron.var_checks()
execute(perceptron, test_inputs, training_inputs, labels)
