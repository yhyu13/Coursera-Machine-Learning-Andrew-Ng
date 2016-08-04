function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a 
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%

X = [ones(m,1) X]; %add the bias varible [1,1,...1];
a1_T = X; %since every row of X is an example, but we want an example as a column.
Z1 = Theta1*a1_T';
a2 = sigmoid(Z1); %get the features of 2nd layer as columns of a2
a2_T = [ones(size(a2',1),1) a2']; %add the bias varible [1,1,...1];
Z2 = Theta2*a2_T';
a3 = sigmoid(Z2);

[~,p] = max(a3',[],2);




% =========================================================================


end
