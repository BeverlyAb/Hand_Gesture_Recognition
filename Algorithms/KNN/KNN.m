%NMF 18 Volunteers
input_dir = 'C:\Users\Beverly\Documents\GitHub\Hand_Gesture_Recognition\Grouped_Data';
test_samp = 5;
train_samp = 5;
volunteer_total = 18;
distinct = 5;
[train,test,training_COL] = dataProducer(input_dir,train_samp,test_samp);
rank = 8;  
[test_row,test_col] = size(test);

% Basis of 5 different gestures 
group = ['fist   ';'middle ';'pinky  ';'pointer';'thumb  '];    

test =test.';
train = train.';
for i = 1: distinct
    buffer = train(1 + (i-1)*volunteer_total*train_samp : i*volunteer_total*train_samp,:);
    buffer = mean(buffer);
    basis(i,:) = buffer;
end
class= knnclassify(test, basis, group,1);
for i = 1 : training_COL
    test_names(i,:) = offset(i, train_samp);
end    
KNN_acc = NMF_accuracy(test_names, class, training_COL);
