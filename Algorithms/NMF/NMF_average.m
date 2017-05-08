
%Due to NMF updating technique, accuracy rate varies, despite constant
%training samples. This takes the average NMF_accuracy.

for i = 1: 1
    NMF_acc(i) = NMF();    
end
NMF_acc = mean(NMF_acc);


input_dir = 'C:\Users\Beverly\Documents\GitHub\Hand_Gesture_Recognition\Grouped_Data';
test_samp = 5;
train_samp = 5;
rank = 8;
[V,test,training_COL] = dataProducer(input_dir,train_samp,test_samp);
[W,H] = nnmf(V, rank);

H_calc = pinv(W)*test;
% Create calculated sample from calculated H to make comparison easier
V_calc = W*H_calc;

% Compare V_calc and test
filenames = dir(fullfile(input_dir,'*csv'));
V_calc = sum(V_calc); %sum col
test =sum(test);
names = recog(V_calc, test, input_dir, training_COL, train_samp);
% pretty arbitrary for loop, no string parsing; all based on Grouped_Data
% folder format
for i = 1 : training_COL
    test_names(i,:) = offset(i, train_samp);
end

NMF_DONE = NMF_accuracy(test_names, names, training_COL)