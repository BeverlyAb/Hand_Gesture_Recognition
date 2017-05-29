%NMF 1 Volunteers
input_dir = 'C:\Users\Beverly\Desktop\CD_VMGLite_1_4_0\CD_VMGLite_1_4_0\SDK\VMGLite_SDK_VS2013_v_1_2\Test_SDK_VS2013\MyFiles\Release\Piano\Filtered';
test_samp = 3;
train_samp = 3;
volunteers = 1;
distinct = 8;
[train,test,training_COL] = dataProducer(input_dir,train_samp,test_samp);
rank = 8;  
[test_row,test_col] = size(test);

% Basis of 8 different gestures 
group = [   'A_chord_sustained  ';
            'B_chord_sustained  ';
            'C_chord_sustained  ';
            'C_thumb_sustained  ';
            'D_pointer_sustained';
            'E_middle_sustained '; 
            'F_ring_sustained   ';
            'G_pinky_sustained  '];

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
