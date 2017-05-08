% http://www.math.union.edu/~jaureguj/PCA.pdf
% http://www.dtic.upf.edu/~afrangi/articles/pami2004.pdf
input_dir = 'C:\Users\Beverly\Documents\GitHub\Hand_Gesture_Recognition\Grouped_Data';
test_samp = 5;
train_samp = 5;
[train,test,training_COL] = dataProducer(input_dir,train_samp,test_samp);
% In short, here is how to perform PCA on a data set.
% 1. Gather the n samples of m-dimensional data ~x1, . . . , ~xn, vectors in R
% m. Compute
% the mean µ (equation (1)), build the matrix B (equation (2)), and compute S
% (equation (3)).
% 2. Find the eigenvalues ?1, . . . , ?m of S (arranged in decreasing order), as well as
% an orthogonal set of eigenvectors ~u1, . . . , ~um.
% 3. Interpret the results: are a small number of the ?i much bigger than all the
% others? If so, this indicates a dimension reduction is possible. Which of the n
% variables are most important in the first, second, etc. principal components?
% Which factors appear with the same or opposite sign as others?
% train_mean = mean(train,2);
% centered = abs(train - train_mean);
% cov = (1 / (training_COL - 1))*(centered*centered.');
% %[wcoeff,~,latent,~,explained] = pca(train,'VariableWeights','variance');
% features = cov' * train;
% 
% test_mean = mean(test,2);
% centered_test = abs(test - test_mean);
% cov_test = (1 / (training_COL - 1))*(centered_test*centered_test.');
% %[wcoeff,~,latent,~,explained] = pca(train,'VariableWeights','variance');
% features_test = cov_test' * test;

%https://stats.stackexchange.com/questions/229092/how-to-reverse-pca-and-reconstruct-original-variables-from-several-principal-com
X = test;
mu = mean(X);

[eigenvectors, scores] = pca(X);

nComp = 2;
% Xhat = scores(:,1:nComp) * eigenvectors(:,1:nComp).';
Xhat = scores * eigenvectors.';
Xhat = bsxfun(@plus, Xhat, mu);

Xhat(1,:);

Xhat = sum(Xhat);
feature_test = sum(train);

% 
% features = sum(features);
% features_test = sum(features_test);
names = recog(Xhat, feature_test, input_dir, training_COL, train_samp);
% pretty arbitrary for loop, no string parsing; all based on Grouped_Data
% folder format
for i = 1 : training_COL
    test_names(i,:) = offset(i, train_samp);
end    
PCA_acc = NMF_accuracy(test_names, names, training_COL)


