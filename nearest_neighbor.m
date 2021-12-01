%Nearest neighbor training error rate is 0%.
%Nearest neighbor test error rate is 18%.

%This function takes in a training data matrix Xtrain, training
%label vector ytrain and uses them to compute the average cat
%and dog vectors. It also takes in a data matrix Xrun and 
%produces a vector of label guesses yguess. Each guess is found
%by searching through Xtrain to find the closest row, and then 
%outputting its label.
%original code
% 
% yguess = zeros(rows_run, 1); 
% Idx = knnsearch(Xtrain, Xrun); 
% yguess = ytrain(Idx, :); 
function yguess = nearest_neighbor(Xtrain,ytrain,Xrun)
[rows_train, ~] = size(Xtrain); 
[rows_run, ~] = size(Xrun);
yguess = zeros(rows_run,1);
distance  = zeros(rows_train, 1); 
for i = 1:rows_run
    for j = 1:rows_train
        distance(j) = norm(Xrun(i,:) - Xtrain(j,:), 2);        
    end
    [~, I] = min(distance);
    yguess(i) = ytrain(I); 
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