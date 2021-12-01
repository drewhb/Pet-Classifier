% For PCA-reduced data with dimension k = 50, linear discriminant analysis training error rate is 7.9%.
% For PCA-reduced data with dimension k = 50, linear discriminant test error rate is 7.5%.
% For PCA-reduced data with dimension k = 50, perceptron training error rate is 7.8%.
% For PCA-reduced data with dimension k = 50, perceptron test error rate is 7.5%.
% For PCA-reduced data with dimension k = 100, linear discriminant analysis training error rate is 5.6%.
% For PCA-reduced data with dimension k = 100, linear discriminant test error rate is 8%.
% For PCA-reduced data with dimension k = 100, perceptron training error rate is 5.8%.
% For PCA-reduced data with dimension k = 100, perceptron test error rate is 8%.
% For PCA-reduced data with dimension k = 200, linear discriminant analysis training error rate is 4.9%.
% For PCA-reduced data with dimension k = 200, linear discriminant test error rate is 7%.
% For PCA-reduced data with dimension k = 200, perceptron training error rate is 4.9%.
% For PCA-reduced data with dimension k = 200, perceptron test error rate is 6.5%.
% For PCA-reduced data with dimension k = 400, linear discriminant analysis training error rate is 3.4%.
% For PCA-reduced data with dimension k = 400, linear discriminant test error rate is 8.5%.
% For PCA-reduced data with dimension k = 400, perceptron training error rate is 3.4%.
% For PCA-reduced data with dimension k = 400, perceptron test error rate is 8.5%.

%This function takes in a training data matrix Xtrain and uses
%it to compute the PCA basis and a sample mean vector. 
%It also takes in a test data matrix Xtest and a dimension k. 
%It first centers the data matrices Xtrain and Xtest by subtracting the
%Xtrain sample mean vector from each of their rows. It then uses the 
%top-k vectors in the PCA basis to project the centered Xtrain and Xtest
%data matrices into a k-dimensional space, and outputs
%the resulting data matrices as Xtrain_reduced and Xtest_reduced.
function [Xtrain_reduced, Xtest_reduced] = reduce_data(Xtrain,Xtest,k)
avg_train = mean(Xtrain); 
Xtrain_centered = Xtrain - ones(size(avg_train,1),1)*avg_train;
Xtest_centered = Xtest - ones(size(avg_train,1),1)*avg_train;
Vk = pca(Xtrain);
Vk = Vk(:,1:k); 
Xtrain_reduced = Xtrain_centered*Vk; 
Xtest_reduced = Xtest_centered*Vk; 
%Your code should go above this line.
if (size(Xtrain_reduced,1)~=size(Xtrain,1)) 
    error("The number of rows in Xtrain_reduced is not the same as the number of rows in Xtrain.")
elseif (size(Xtest_reduced,1)~=size(Xtest,1)) 
    error("The number of rows in Xtest_reduced is not the same as the number of rows in Xtest.")
elseif (size(Xtrain_reduced,2)~=k) 
    error("The number of columns in Xtrain_reduced is not equal to k.")
elseif (size(Xtest_reduced,2)~=k) 
    error("The number of columns in Xtest_reduced is not equal to k.")
end
