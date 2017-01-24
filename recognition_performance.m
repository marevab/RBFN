function [thresholds, train_accuracy, test_accuracy] = recognition_performance(y_train, train_classlabel_logical,y_test,test_classlabel_logical,nb_points)

%
% This function enables to obtain the recognition performance of RBFN
% y_train : network outputs of training set
% train_classlabel_logical : vector with {0,1} values
% y_test : network outputs of test set
% test_classlabel_logical : vector with {0,1} values
% nb_points : number of values of thresholds we want
% Returns the thresholds values (nb_points x 1 vector), 
% the accuracy values of the training and test sets
%

% Define accuracy vectors for both training and test sets
train_accuracy = zeros(1,nb_points);
test_accuracy = zeros(1,nb_points);

% Define a vector of thresholds
thresholds = zeros(1,nb_points);

% Loop on the points we want to test
for i = 1:nb_points
    
    % Define the current threshold
    t = (max(y_train) - min(y_train)) * (i-1) / nb_points + min(y_train);
    
    % Update the thresholds vector
    thresholds(i) = t;
    
    % Separate the values based on the threshold in training set
    neg = find(y_train < t);
    pos = find(y_train >= t);
    train_accuracy(i) = length( find(train_classlabel_logical(neg)==0)) + length(find(train_classlabel_logical(pos)==1));
    train_accuracy(i) = train_accuracy(i)/length(train_classlabel_logical);
    
    % Separate the values based on the threshold in test set
    neg = find(y_test < t);
    pos = find(y_test >= t);
    test_accuracy(i) = length(find(test_classlabel_logical(neg)==0)) + length(find(test_classlabel_logical(pos)==1));
    test_accuracy(i) = test_accuracy (i)/length(test_classlabel_logical);
end



end

