function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C_vec = [0.03,0.3,3,30];
sigma_vec = [0.01,0.1,1,10];

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
C = 0;
sigma = 0;
error = 1000;

for i = 1:length(C_vec)
    for j = 1:length(sigma_vec)
        C1 = C_vec(i);
        sigma1 = sigma_vec(j);
        model= svmTrain(X, y, C1, @(x1, x2) gaussianKernel(x1, x2, sigma1));
        predictions = svmPredict(model,Xval);
        error1 = mean(double(predictions ~= yval));
        if error1<error
            C = C1;
            sigma = sigma1;
            error = error1;
        end
    end
end

% =========================================================================

end
