% Calculates the accuracacies of KMC overall and for each gesture
% individually
distinct = 5;
input_dir = 'C:\Users\Beverly\Documents\GitHub\Hand_Gesture_Recognition\Grouped_Data';
test_samp = 5;
train_samp = 5;
volunteers = 18;
rank = 8;
[train,test,training_COL] = dataProducer(input_dir,train_samp,test_samp);

[idx,trainBasis,sumd,D] = kmeans(train,8);
% Label the results 
[test_names,calc_names] = label(trainBasis, test, input_dir, training_COL, train_samp,volunteers);
% Get Accuracies
[KMC_DONE, each_KMC]= accuracy(test_names, calc_names, training_COL,distinct);
KMC_DONE