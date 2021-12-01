%Perceptron training error rate is 0%
%Perceptron test error rate is 17%

%This function takes in a training data matrix Xtrain, training
%label vector ytrain and uses them to the decision rule corresponding
%to a very simple one-layer neural network: the perceptron. 
%It also takes in a data matrix Xrun and produces a vector of label
%guesses yguess, corresponding to the sign of the linear prediction.
function yguess = perceptron(Xtrain,ytrain,Xrun)
[rows, ~] = size(Xrun); 
yguess = (-1)*ones(rows, 1); 
threshold = pinv(Xtrain'*Xtrain)*Xtrain'*ytrain; 

for i = 1:rows
    if (Xrun(i,:)*threshold >= 0)
        yguess(i) = 1; 
    end
end


%Your code should go above this line.
if (~iscolumn(yguess))
    error("yguess is not a column vector.")
elseif (length(yguess)~=size(Xrun,1))
    error("Length of yguess is not equal to the number of rows in Xrun.")
elseif (sum(unique(abs(ytrain))~=1))
    warning("Some elements in ytrain are not +1 or -1.")
elseif (sum(unique(abs(yguess))~=1))
    warning("Some elements in yguess are not +1 or -1.")
end