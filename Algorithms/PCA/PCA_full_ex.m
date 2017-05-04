%input_dir = 'C:\Users\004737953\Documents\MATLAB\VMG\Gesture_CSV';
input_dir = 'C:\Users\Beverly\Documents\GitHub\Hand_Gesture_Recognition\All_Data';
% 13 volunteers (A-M) in train, 5 volunteer (N-R) in test sample
train_volunteers = 13;
sample_volunteers = 5;
distinct = 5;

ex_samp = sample_volunteers*distinct;
filenames = dir(fullfile(input_dir,'*csv'));
num_images = numel(filenames)-ex_samp;
subset = fix(num_images / 8); % integer
index = 1;

    for i = 1 : num_images
        %removes time(col) and name(row), square 8 by 8 of subset - "subsets"
        %for j = 1 : subset - 1
        
       %     filename = csvread(fullfile(input_dir, filenames(i).name),8*j - 7, 1,[8*j-7, 1, 8*j, 8]);    
        %    gesture(:,index) = filename(:);
         %   index = index + 1;
      %  end
        filename = csvread(fullfile(input_dir, filenames(i).name),1, 1,[1, 1, 8, 8]);
            gesture(:,index) = filename(:);
             index = index + 1;
    end
   
    mean_gest = mean(gesture,2);   
    %gesture = gesture - repmat(mean_gest, 1, train_volunteers*5*(subset-1));
    gesture = gesture - repmat(mean_gest, 1, num_images);
    [evectors, score, evalues] = pca(gesture');
    
    num_eigenfaces = 1;
    evectors = evectors(:,1:num_eigenfaces);
    features = evectors' * gesture;
    %Read Sample Data%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    test = dir(fullfile(input_dir, '*csv'));
    i = 1;

     for n = num_images + 1: num_images + ex_samp
        %removes time(col) and name(row)
     %   filename = csvread(fullfile(input_dir, filenames(n).name),8*j - 7, 1,[8*j-7, 1, 8*j, 8]);
         filename = csvread(fullfile(input_dir, filenames(n).name),1, 1,[1, 1, 8, 8]);    
        fullfile(input_dir, filenames(n).name); 
        feature_vec = evectors' * (filename(:) - mean_gest);
        similarity_score = arrayfun(@(n) 1 / (1 + norm(features(:,n) - feature_vec)), 1:num_images);
        [match_score, match_ix] = max(similarity_score);
        class(i,:) = string(name(match_ix,test));
        i = i + 1;
     end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    count_misses = [];
    
    %Test knn with basis with varying subject sizes
for i = 1:5
   % Output Recognition Results
    [accuracy_rate(i,:),actual,calc,misses] = accuracy2(class,input_dir,sample_volunteers);
    temp = gestureCounter2(misses,distinct,sample_volunteers);
    count_misses = vertcat(count_misses,temp);
end

% Graph Accuracy v. Basis Subject Size
accuracyPlot = graphAccuracy(accuracy_rate);
% Graph Missed Gesture Classification v. Basis Subject Size
missBar = gestureBar(count_misses);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    
    
    