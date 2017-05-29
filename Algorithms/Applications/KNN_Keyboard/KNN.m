%NMF 1 Volunteers
input_dir = 'C:\Users\Beverly\Desktop\CD_VMGLite_1_4_0\CD_VMGLite_1_4_0\SDK\VMGLite_SDK_VS2013_v_1_2\Test_SDK_VS2013\MyFiles\Release\Keyboard\V2';
test_samp = 9;
train_samp = 9;
volunteers = 1;
distinct = 5;
% train and test dim. are # of gestures * # sample x # of features
[train,test,training_COL] = dataProducer(input_dir,train_samp,test_samp);
rank = 8;  
[test_row,test_col] = size(test);
 % Basis of 5 different gestures 
        group = [   'enter_pinky_sustained   ';
                    'i_middle_sustained      ';
                    'o_ring_sustained        ';
                    'spacebar_thumb_sustained';
                    'y_pointer_sustained     ']; 
%
%tranposed to fit MATLAB KNN
test =test.';
train = train.';
%basis must be # of gestures x # of features and is formed from train
for i = 1: distinct
    buffer = train(1 + (i-1)*volunteers*train_samp : i*volunteers*train_samp,:);
    buffer = mean(buffer);
    basis(i,:) = buffer;
end
% class is the reconstructed recognition 
class= knnclassify(test, basis, group,1);

%arb. for loop of sample labels, training_COL = test_COL
for i = 1 : training_COL
    test_names(i,:) = offset(i, train_samp,volunteers);
end    
[KNN_acc,KNN_ind] = accuracy(test_names, class, train_samp*distinct, distinct);
KNN_acc
