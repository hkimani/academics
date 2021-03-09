from module import lib
import numpy as np


def execute(algorithm, test_inputs, inputs, labels):

    # Train the perceptron
    algorithm.train(inputs, labels)
    total_correct = 0
    total = len(inputs)

    for idx, input_array in enumerate(test_inputs):
        # Test the perceptron
        output = 1 if algorithm.predict(input_array) == 0 else 2
        if(output == labels[idx]):
            total_correct += 1

    accuracy = total_correct/total * 100
    return f'accuracy is {accuracy}%'


def import_data(path_to_file):
    file = open(path_to_file, 'r')
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


# Heart data
training_inputs, labels = import_data('data/heart.data.txt')
test_inputs = training_inputs

print('\nPerceptron algorithm\n')

perceptron = lib.Perceptron(13)
perceptron.var_checks()
accuracy = execute(perceptron, test_inputs, training_inputs, labels)
print(accuracy)


# Diabetes data
training_inputs, labels = import_data('data/pimadiabetes.data.txt')
test_inputs = training_inputs

print('\nAdaline algorithm\n')

# Adaline algorithm
adaline = lib.Adaline(8, 100)
adaline.var_checks()
accuracy = execute(adaline, test_inputs, training_inputs, labels)
print(accuracy)
