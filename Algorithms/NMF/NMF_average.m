% Calculates the accuracacies of NMF overall and for each gesture
% individually
distinct = 5;

input_dir = 'C:\Users\Beverly\Documents\GitHub\Hand_Gesture_Recognition\Grouped_Data';
test_samp = 5;
train_samp = 5;
rank = 8;
volunteers = 18;
[V,test,training_COL] = dataProducer(input_dir,train_samp,test_samp);
% [W,H] = nnmf(V, rank); %MATLAB nmf
[ W,H]= NMF();           %personal nmf
H_calc = pinv(W)*test;

% Create calculated sample from calculated H to make comparison easier
V_calc = W*H_calc;

% Label the results 
[test_names,calc_names] = label(V_calc, test, input_dir, training_COL, train_samp,volunteers);
% Get Accuracies
[NMF_DONE, each_NMF]= accuracy(test_names, calc_names, training_COL,distinct);
NMF_DONE