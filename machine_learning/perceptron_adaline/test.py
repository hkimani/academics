from module import lib
import numpy as np


def test(algorithm, test_inputs):
    # Testing the function (AND || OR)

    # Training inputs
    inputs = []

    # Adding training inputs
    inputs.append(np.array([1, 1]))
    inputs.append(np.array([1, 0]))
    inputs.append(np.array([0, 1]))
    inputs.append(np.array([0, 0]))

    # Labels
    labels = np.array([1, 0, 0, 0])

    # Train the perceptron
    algorithm.train(inputs, labels)

    for i in test_inputs:
        # Test the perceptron
        print(algorithm.predict(i))


print('\nPerceptron algorithm\n')

# Perceptron algorithm
perceptron = lib.Perceptron(2)
perceptron.var_checks()
test(perceptron, [np.array([1, 1]), np.array([0, 1]), ])

print('\nAdaline algorithm\n')

# Adaline algorithm
adaline = lib.Adaline(2, 1000)
adaline.var_checks()
test(adaline, [np.array([1, 1]), np.array([1, 0])])
