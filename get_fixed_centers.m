function [mu, sigma] = get_fixed_centers(X, M )

%
% This function enables to obtain the centers of the hidden units
% X are the data points : (size of picture) x (nb of pictures) matrix
% M is the number of centers selected at random (M < (nb of pictures) )
% Returns the centers and the widths of the hidden units :
%       mu : (size of pictures) x M matrix
%       sigma : M x 1 vector
%

% Number of samples : number of columns of the matrix of input data
nb_samples = length(X(1,:));

% Generate M random points among the dataset
permutation = randperm(nb_samples); % Permute the numbers from 1 to N
center_numbers = permutation(1:M); % Take the M first numbers
% Define the coordinates of the M centers
mu = X(:,center_numbers);

% Calculations of the distances between each centers
distance = zeros(M,M);
for j = 1:M
    for i = 1:j
        distance(i,j) = sum((mu(:,i) - mu(:,j)) .* (mu(:,i) - mu(:,j)));
    end
end

% Define the maximal distance between the centers
dmax = max(max(distance));
% Define the widths (sigma)
sigma = (dmax / sqrt(2 * M)) * ones(M,1);

end

