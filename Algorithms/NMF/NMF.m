%NMF with 18 volunteers
input_dir = 'C:\Users\Beverly\Documents\GitHub\Hand_Gesture_Recognition\Grouped_Data';
[V,test,training_COL] = dataProducer(input_dir);
rank = 8;  
% initialize W, H
W = 2 * rand(8,rank);    % (8 x 8)                                                   
H = 2 * rand(rank, 180);     % (8 x 180)
iteration = 1000;

% Run NMF repeatedly until reaching iteration criterion
for ii = 1:iteration
   W = W.*(V*H')./(W*H*H'+ 1*10.^(-100));
   H = H.*(W'*V)./(W'*W*H + 1*10.^(-100)); 
end
H_calc = pinv(W)*test;
% Create calculated sample from calculated H to make comparison easier
V_calc = W*H_calc;

% Compare V_calc and test
filenames = dir(fullfile(input_dir,'*csv'));
V_calc = sum(V_calc);
test =sum(test);
names = recog(V_calc, test, input_dir, training_COL);
% pretty arbitrary for loop, no string parsing; all based on Grouped_Data
% folder format
for i = 1 : training_COL
    test_names(i,:) = offset(i, 2);
end    
NMF_acc = NMF_accuracy(test_names, names, training_COL);

