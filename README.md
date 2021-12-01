# Pet-Classifier
Makes a guess at which photos are cats and which are dogs.

The data set used is with greyscaled 64x64 imaages. We were given 2000 photos, first 1000 are cats and second 1000 are dogs. 
-> The function read_data loads the images into matlab, and converts each into a 4096 length row vector, and each of the row vectors makes up a matrix of the images. Additionally, read_data creates a column vector y which contains a binary label for each image, 1 for dog, -1 for cats. 
-> The function split_data takes this created matrix and randomly selects 80% of the iamges to be used as training data, where the remaining 20% is used to test. It also creates new corresponding y label vectors to keep track and calculate the accuracy after guessing a label vector. 

-> Each of the functions, closest_average, perceptron (1 layer artificial nuearal net), nearest_neighbor, and lda (linear discriminant analysis) are different decision rules used to train and test with the data in different ways and output a vector y_guess that has the labels that the decision rule came up with. 

-> error_rate compares the guesses y vector to the actual y vector to determine the error

-> reduce_data performs principle component analysis on the images to select the "k" most important features, and after applying to the data improves the accuracy of the perceptron and lda decision rules. 

-> Additionally the function pet_classifier uses a more complex rule and the function was generated from the MATLAB classification learner library. This function is what achieves the highest accuracy. It uses cosine based nearest neighbor test, with PCA explaining 90% variance. 

-> Lastly runall calls each of the previous functions (excluding pet_classifier - you can play with that on your own), tests them, and outputs the error rate. 
