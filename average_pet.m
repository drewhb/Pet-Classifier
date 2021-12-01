%This function takes in a data matrix X and a label
%vector y and outputs the average cat image and average dog image.
function [avgcat, avgdog] = average_pet(X,y)

 
cats = X(y==-1,:); 
dogs = X(y==1,:); 

avgdog = mean(dogs,1); 
avgcat = mean(cats,1); 

%Your code should go above this line.
if (size(avgcat,1)~=1) 
    error("The variable avgcat is not a row vector.")
end
if (size(avgcat,2)~=size(X,2))
    error("The variable avgcat does not have the same number of columns as the data matrix input.")
end
if (size(avgdog,1)~=1) 
    error("The variable avgdog is not a row vector.")
end
if (size(avgdog,2)~=size(X,2)) 
    error("The variable avgdog does not have the same number of columns as the data matrix input.")
end