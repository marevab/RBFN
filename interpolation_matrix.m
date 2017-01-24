function phi = interpolation_matrix(X,M,mu,sigma,random)

%
% This function enables to obtain the interpolation matrix
% X are the data points : (size of picture) x (nb of pictures) matrix
% M is the number of centers (M < length(x))
% mu is a matrix with the centers of hidden units : (size of picture) * M
% matrix
% sigma is the widths of the hidden units : M * 1 vector
% random is a boolean : true if we use the Fixed Selected Centers method
% Returns the interpolation matrix Phi : length(x) * M
%

% Number of samples : number of columns of the matrix of input data
nb_samples = length(X(1,:));

% Define the matrix Phi
phi = zeros(nb_samples,M);
for i = 1:nb_samples
    for j = 1:M
        phi(i,j) = exp( - sum((X(:,i) - mu(:,j)) .* (X(:,i) - mu(:,j))) / (2 * sigma(j) * sigma(j)));
    end
end

% If we use the method of 'Fixed centers Selected at Random', we add a bias
if (random == true)
    phi = [ones(nb_samples,1) , phi];
end

end

