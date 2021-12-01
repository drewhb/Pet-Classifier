%Linear discriminant analysis training error rate is 0.88%.
%Linear discriminant analysis test error rate is 22%.

%This function takes in a training data matrix Xtrain, training
%label vector ytrain and uses them to compute the cat
%and dog sample mean vectors as well as the sample covariance matrix 
%(which is assumed to be equal for cats and dogs). 
%It also takes in a data matrix Xrun and produces a vector of
%label guesses yguess, corresponding to the ML rule for
%jointly Gaussian vectors with different means and the same 
%covariance matrix.
function yguess = lda(Xtrain,ytrain,Xrun)
[avgcat, avgdog] = average_pet(Xtrain, ytrain); 
[rows,~] = size(Xrun); 
yguess = ones(rows, 1);
yguess = yguess*(-1); 
cats = Xtrain(ytrain == -1, :); 
dogs = Xtrain(ytrain == 1, :); 
cov_cat = cov(cats); 
cov_dog = cov(dogs); 
[ntrain, ~] = size(Xtrain); 
[ntrain_cat, ~] = size(cats);
[ntrain_dog, ~] = size(dogs); 
covariance = (1/(ntrain-2))*(((ntrain_cat-1)*(cov_cat)) + ((ntrain_dog-1)*(cov_dog))); 
inv_cov = pinv(covariance); 
threshold = ((avgdog*inv_cov*avgdog')-(avgcat*inv_cov*avgcat'));
for i = 1:rows
    if (((2*Xrun(i,:))*(inv_cov)*(avgdog-avgcat)') >= threshold)
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