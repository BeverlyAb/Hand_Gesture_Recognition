function [W, H ] = NMF()
%NMF with 18 volunteers, this works best when test_samp == train_samp
%This loads W and H from previously accurate testings
% 
input_dir = 'C:\Users\Beverly\Documents\GitHub\Hand_Gesture_Recognition\Grouped_Data';
test_samp = 5;
train_samp = 5;
distinct = 5;
[V,test,training_COL] = dataProducer(input_dir,train_samp,test_samp);
rank = 8;  
[row,col] = size(V);
 % initialize W, H
load Good_Basis;
W = W_good;
H = H_good;
% W = 2 * rand(row,rank);    % (8 x 8) 
% H = 2 * rand(rank, col);     % (8 x 180)
iteration = 1000;

% Run NMF repeatedly until reaching iteration criterion
for ii = 1:iteration
   W = W.*(V*H')./(W*H*H'+ 1*10.^(-100));
   H = H.*(W'*V)./(W'*W*H + 1*10.^(-100)); 
end
H_calc = pinv(W)*test;
% Create calculated sample from calculated H to make comparison easier
V_calc = W*H_calc;
