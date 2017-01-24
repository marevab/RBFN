%% Question 2.c : Regularization method

% Define the regularization factors
lambda = [2, 10, 20, 50, 100];

%% Plot of the recognition performance of the resulting RBFN : exact interpolation without regularization
figure
subplot((length(lambda) + 1) / 2, 2, 1)
plot(thres_exact, train_accuracy_exact,'.-',thres_exact, test_accuracy_exact,'^-');
axis([1,8,0,1])
xlabel('threshold value')
ylabel('accuracy')
 title('Exact interpolation method without regularization')
legend('train','test')

%% Plot of the resulting RBFN : exact interpolation with regularization with different values of lambda

% Define the weights matrix for different lambda
weights_regular_matrix = zeros(N, length(lambda));

% Loop on the lambda values
for i = 1:length(lambda)
    
    % Compute the weights based on the interpolation matrix found with the
    % exact interpolation
    weights_regular_matrix(:,i) = (phi_exact_train' * phi_exact_train + diag(lambda(i) * ones(N,1))) \ (phi_exact_train' * train_classlabel');
    y_train_regular = phi_exact_train * weights_regular_matrix(:,i);
    
    % Output of the test set
    y_test_regular = phi_exact_test * weights_regular_matrix(:,i);

    % Evaluation of the recognition performance of the exact interpolation
    % method
    [thres_regular, train_accuracy_regular, test_accuracy_regular] = recognition_performance(y_train_regular, train_classlabel_logical, y_test_regular, test_classlabel_logical, 1000);

    % Plot the result
    subplot((length(lambda) + 1) / 2, 2, i+1)
    plot(thres_exact, train_accuracy_regular,'.-',thres_exact, test_accuracy_regular,'^-');
    axis([1,8,0,1])
    xlabel('threshold value')
    ylabel('accuracy')  
    title(['Exact interpolation method with regularization equal to ' num2str(lambda(i))])
end