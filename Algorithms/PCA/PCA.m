input_dir = 'C:\Users\Beverly\Documents\GitHub\Hand_Gesture_Recognition\All_Data';
% http://www.cs.otago.ac.nz/cosc453/student_tutorials/principal_components.pdf
% 13 volunteers (A-M) in sample, 5 volunteer (N-R) in test
filenames = dir(fullfile(input_dir,'*csv'));
num_images = numel(filenames)-25;
filename = csvread(fullfile(input_dir, filenames(i).name),1, 1);
[n,col] = size(filename);
% exclude title
row = n - 1;

A = [5 7 8; 0 1 9; 4 3 6];
A(:,:,2) = [1 0 4; 3 5 6; 9 8 7]
 xy = cov(A)



for i = 1 : num_images
        %removes time(col) and name(row)
        filename = csvread(fullfile(input_dir, filenames(i).name),1, 1);
        train(i+col,:,:) = filename.';
end
