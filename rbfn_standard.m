%% Question 2.a : exact interpolation method

% Compute the interpolation matrix
sigma_exact = 100;
N = length(train_data(1,:));
phi_exact_train = interpolation_matrix(train_data, N, train_data, sigma_exact * ones(N,1), false);
% Compute the weights
weights_exact = inv(phi_exact_train) * train_classlabel';
y_train_exact = phi_exact_train * weights_exact;

% Output of the test set
phi_exact_test = interpolation_matrix(test_data, N, train_data, sigma_exact * ones(N,1), false);
y_test_exact = phi_exact_test * weights_exact;

% Evaluation of the recognition performance of the exact interpolation
% method
[thres_exact, train_accuracy_exact, test_accuracy_exact] = recognition_performance(y_train_exact, train_classlabel_logical, y_test_exact, test_classlabel_logical, 1000);

%% Question 2.b : Fixed Centers Selected at Random
M = 100;
[mu_random, sigma_random] = get_fixed_centers(train_data, M);
phi_random_train = interpolation_matrix(train_data, M, mu_random, sigma_random, true);
% Compute the weights
weights_random = inv(phi_random_train' * phi_random_train) * (phi_random_train' * train_classlabel');
y_train_random = phi_random_train * weights_random;

% Output of the test set
phi_random_test = interpolation_matrix(test_data, M, mu_random, sigma_random, true);
y_test_random =  phi_random_test * weights_random;

% Evaluation of the recognition performance of the exact interpolation
% method
[thres_random, train_accuracy_random, test_accuracy_random] = recognition_performance(y_train_random, train_classlabel_logical, y_test_random, test_classlabel_logical, 1000);


%% Plot the accuracy

figure
subplot(2,1,1)
plot(thres_exact, train_accuracy_exact,'.-',thres_exact, test_accuracy_exact,'^-');
axis([1,8,0.5,1])
xlabel('threshold value')
ylabel('accuracy')
title('Recognition performance with exact interpolation')
legend('train','test')

subplot(2,1,2)
axis([1,8,0.5,1])
plot(thres_exact, train_accuracy_random,'.-',thres_exact, test_accuracy_random,'^-');
xlabel('threshold value')
ylabel('accuracy')
title('Recognition performance with Fixed Centers Selected at Random')
legend('train','test')
