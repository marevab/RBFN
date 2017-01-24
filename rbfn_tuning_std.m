%% Question 2.d : Variations on the standard deviation

% Define different values of standard deviation
std = [0.1 , 1, 10 , 100, 1000, 1000];

%% Plot of the resulting RBFN : exact interpolation with regularization with different values of lambda

% Define the weights matrix for different lambda
weights_std_matrix = zeros(M+1, length(std));

% Loop on the lambda values
for i = 1:length(std)

    % Define the widths (sigma)
    sigma = std(i) * ones(M,1);

    % Compute the weights based on the interpolation matrix found with the
    % Fixed Centers Selected at random method
    phi_std_train = interpolation_matrix(train_data, M, mu_random, sigma, true);
    weights_std_matrix(:,i) = inv(phi_std_train' * phi_std_train) * (phi_std_train' * train_classlabel');
    y_train_std = phi_std_train * weights_std_matrix(:,i);

    % Output of the test set
    phi_std_test = interpolation_matrix(test_data, M, mu_random, sigma, true);
    y_test_std = phi_std_test * weights_std_matrix(:,i);

    % Evaluation of the recognition performance
    [thres_std, train_accuracy_std, test_accuracy_std] = recognition_performance(y_train_std, train_classlabel_logical, y_test_std, test_classlabel_logical, 1000);

    % Plot the result
    subplot(length(std)/2, 2, i)
    plot(thres_exact, train_accuracy_std,'.-',thres_exact, test_accuracy_std,'^-');
    axis([1,8,0,1]);
    xlabel('threshold value')
    ylabel('accuracy')
    title(['Fixed Centers Selected at random method with a standard deviation equal to ' num2str(std(i))])
end
