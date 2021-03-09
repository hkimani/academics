# Library for support of large multidimensional arrays and matrices
import numpy as np

c = 0


class Perceptron:
    # Inheriting from The base class of the class hierarchy.

    '''
    INITIALIZATION
    input_count: determines how many weights that are needed for learning
    epochs: (Threshold) The number of passes to be completed by the training dataset
    learning_rate: How much our weights change at each epoch of the training data

    weights: an array/vector initialized with n + 1 number of zeros
    why +1?: this is the bias weight which is used to shift the activation function by adding a constant.

    PREDICTION ALGORITHM
    f(x) = 1 if w · x + b > 0 : 0 otherwise
    The above function takes in an input x and returns 1 if the weight multiplied by the input plus the bias
    is greater than 0. Otherwise it returns 1.

    The input for the predct function should be a numpy array of a dimension equal to the input_count parameter

    # summation

    np.dot(a, b) == a · b

    Gets the dot product of the inputs and the weights from index 1. (The first input is the bias)
    Both vectors/arrays should be of equal dimensions

    TRAINING ALGORITHM
    training inputs: list of numpy vectors to be used as inputs by the prediction algorithm
    labels: numpy array of expected output values for each of the corresponding inputs of the training inputs

    # i.e training_inputs[n] has expected output of labels[n]

    # zip function
    Returns a zip object, which is an iterator of tuples (a tuple of tuples) where the first item in each passed
    iterator is paired together and so for the second, third upto nth item

    # Zip function example
    a = ("John", "Charles", "Mike")
    b = ("Jenny", "Christy", "Monica")

    x = zip(a, b)

    # use the tuple() function to display a readable version of the result:

    print(tuple(x))

    # Learning rule
    w <- w + α(y — f(x))x

    # ... Learning taking place
    error: label - prediction
    new_weights: (learning_rate * error * inputs) + old_weights
    new_bias_weight: (learning_rate * error) + old_bias_weight

    '''

    def __init__(self, input_count, epochs=100, learning_rate=0.01):
        self.epochs = epochs
        self.learning_rate = learning_rate
        self.weights = np.zeros(input_count + 1)

    def predict(self, inputs):
        # slice notation
        # Dot product of the (inputs and the weights) + bias
        summation = np.dot(inputs, self.weights[1:]) + self.weights[0]

        # (Step function)Activation function
        if summation > 0:
            activation = 1
        else:
            activation = 0
        return activation

    def train(self, training_inputs, labels):

        # Loop for the number of epochs
        for _ in range(self.epochs):

            # Here we zip the training inputs and labels together to create a new iterable object
            for inputs, label in zip(training_inputs, labels):

                # Get the prediction for the inputs
                prediction = self.predict(inputs)

                error = label - prediction

                # Adjust the weights based on the error we get from the prediction
                self.weights[1:] += self.learning_rate * error * inputs

                # Adjust the bias weight
                self.weights[0] += self.learning_rate * error

    def var_checks(self):
        print('Learning rate: ' + str(self.learning_rate))
        print('Epochs: ' + str(self.epochs))
        print('Weights: ' + str(self.weights))


class Adaline:

    def __init__(self, input_count, epochs=100, learning_rate=0.01):
        self.epochs = epochs
        self.learning_rate = learning_rate
        self.weights = np.zeros(input_count + 1)

    def summation(self, inputs):
        # slice notation
        # Dot product of the (inputs and the weights) + bias
        summation = np.dot(inputs, self.weights[1:]) + self.weights[0]
        return summation

    def activation(self, summation):
        # (Step function)Activation function
        if summation > 0:
            activation = 1
        else:
            activation = 0
        return activation

    def predict(self, inputs):
        summation = self.summation(inputs)
        output = self.activation(summation)
        return output

    def train(self, training_inputs, labels):
        # Loop for the number of epochs
        for _ in range(self.epochs):

            # Here we zip the training inputs and labels together to create a new iterable object
            for inputs, label in zip(training_inputs, labels):

                # Get the summation of inputs and weight
                summation = self.summation(inputs)

                error = label - summation

                # Adjust the weights based on the error we get from the summation
                self.weights[1:] += self.learning_rate * error * inputs

                # Adjust the bias weight
                self.weights[0] += self.learning_rate * error

    def var_checks(self):
        print('Learning rate: ' + str(self.learning_rate))
        print('Epochs: ' + str(self.epochs))
        print('Weights: ' + str(self.weights))
