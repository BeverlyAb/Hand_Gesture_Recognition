function [ training, testing, total_data ] = dataProducer(input_dir)
% Produces training and test matrices 
% training is of C by N*2 matrix
%   C - characteristics (8 in this case from F1 to YAW)
%   N - total number of volunteers
% test is of C by  N* 2  
% Essentially, the matrices are mutually exclusive, but not volunteer
% exclusive and each volunteer contributes 2 samples per training matrix and 2
% samples per test matrix
% total_data is the total number of training samples, (Ex: 18 volunteers *
% 5 gestures * 2)
training = [];
testing = [];
filenames = dir(fullfile(input_dir,'*csv'));
num_images = numel(filenames);
for i = 1 : num_images
    fullfile(input_dir, filenames(i).name);
    train = csvread(fullfile(input_dir, filenames(i).name),1,1,[1,1,2,8]);
    train = train.';
    training = horzcat(training, train);
    test = csvread(fullfile(input_dir, filenames(i).name),4,1,[4,1,5,8]);
    test = test.';
    testing = horzcat(testing, test);
end
[~,total_data] = size(training);
end

