function [ test_names,names ] = label(calc, test, input_dir, training_COL, train_samp,volunteers)
% Assigns the labels for calc results using test sample and directory
% this calls recog() abd offset()
filenames = dir(fullfile(input_dir,'*csv'));
my_calc = sum(calc); %sum col
test =sum(test);
names = recog(my_calc, test, input_dir, training_COL, train_samp,volunteers);

% pretty arbitrary for loop, no string parsing; all based on Grouped_Data
% folder format
for i = 1 : training_COL
    test_names(i,:) = offset(i, train_samp);
end



