%NMF 18 Volunteers
input_dir = 'C:\Users\Beverly\Documents\GitHub\Hand_Gesture_Recognition\Grouped_Data';
test_samp = 5;
train_samp = 5;
volunteers = 18;
distinct = 5;
[train,test,training_COL] = dataProducer(input_dir,train_samp,test_samp);
rank = 8;  
[test_row,test_col] = size(test);

% Basis of 5 different gestures 
group = ['fist   ';'middle ';'pinky  ';'pointer';'thumb  '];    

%tranposed to fit MATLAB KNN
test =test.';
train = train.';
for i = 1: distinct
    buffer = train(1 + (i-1)*volunteers*train_samp : i*volunteers*train_samp,:);
    buffer = mean(buffer);
    basis(i,:) = buffer;
end
class= knnclassify(test, basis, group,1);
for i = 1 : training_COL
    test_names(i,:) = offset(i, train_samp,volunteers);
end    
[KNN_acc,KNN_ind] = accuracy(test_names, class, training_COL, distinct);
KNN_acc
