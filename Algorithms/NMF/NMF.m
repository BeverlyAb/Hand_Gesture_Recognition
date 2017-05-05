input_dir = 'C:\Users\Beverly\Documents\GitHub\Hand_Gesture_Recognition\Square_Data';
% 13 volunteers (A-M no L) in train, 5 volunteer (N-R) in test sample
train_volunteers = 12;
sample_volunteers = 4;
distinct = 5;

ex_samp = sample_volunteers*distinct;
filenames = dir(fullfile(input_dir,'*csv'));
num_images = numel(filenames)-ex_samp;
subset = fix(num_images / 8); % integer
index = 1;

    for i = 1 : num_images
        fullfile(input_dir, filenames(i).name);
        filename = csvread(fullfile(input_dir, filenames(i).name),1,1,[1,1,98,8] );
        filename = reshape(filename, 28,28);
        gesture(:,index) = filename(:);
        index = index + 1;
    end

dimData = size(gesture);      
V = gesture; %match dimenstions
rank = 8;  
% initialize W, H
W = 2 * rand(784,rank);    % (m x 28)                                                   
H = 2 * rand(rank, num_images);     % (28 x n)

iteration = 10000;

%   1e) Run NMF repeatedly until reaching iteration criterion
for ii = 1:iteration
   W = W.*(V*H')./(W*H*H'+ 1*10.^(-100));
   H = H.*(W'*V)./(W'*W*H + 1*10.^(-100)); 
end

V = W*H;
V = reshape(V,98,8,num_images);
gesture = reshape(gesture,98,8,num_images);
difference = abs(V - gesture);

8 values = col
rows 30 training, 20 testing
solve h*, V*=WH*
% Test
% Sample%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
index = 1;
 for i = num_images + 1 : num_images + ex_samp
        fullfile(input_dir, filenames(i).name);
        filename = csvread(fullfile(input_dir, filenames(i).name),1,1,[1,1,98,8] );
        filename = reshape(filename, 28,28);
        sample(:,index) = filename(:);
        index = index + 1;
end
%sample = reshape(sample,98,8,ex_samp);
%difference = abs(V - sample);

