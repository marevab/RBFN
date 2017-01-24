clear all 
close all 

% Load data 
load MNIST_dataset.mat;

% Select the classes '8' and '1' for training set
train_idx_81 = find(train_classlabel == 8 | train_classlabel == 1);
train_classlabel = train_classlabel(train_idx_81);
train_data = train_data(:,train_idx_81);

% Select the classes '8' and '1' for test set
test_idx_81 = find(test_classlabel == 8 | test_classlabel == 1);
test_classlabel = test_classlabel(test_idx_81);
test_data = test_data(:,test_idx_81);

% Convert the ground-truth label information into {0,1} (useful to assess
% the recognition performance)
train_classlabel_logical = (train_classlabel == 8);
test_classlabel_logical = (test_classlabel == 8);
