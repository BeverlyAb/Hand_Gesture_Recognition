input_dir = 'C:\Users\Beverly\Documents\GitHub\Hand_Gesture_Recognition\Grouped_Data';
test_samp = 5;
train_samp = 5;
[training,test,training_COL] = dataProducer(input_dir,train_samp,test_samp);
coeff = pca(training);


