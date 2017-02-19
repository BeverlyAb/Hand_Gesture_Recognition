%Creates a Training Basis and Testing Sample from a sample directory and training directory in order to have  
% exclusive data and exclusive SUBJECTS. This develops an accuracy plot and bar graph of misidentified gestures
% with respect to varying Basis subject sizes. 

sample_dir = 'C:\Users\Beverly\Documents\GitHub\Hand_Gesture_Recognition\All';
basis_dir = 'C:\Users\Beverly\Documents\GitHub\Hand_Gesture_Recognition\All';
distinct = 5;

% Basis of 5 different gestures 
group = ['fist   ';'middle ';'pinky  ';'pointer';'thumb  '];    

%call basis to receive subject, ROW, and COL from sample_dir
[~,sampleSubjects,sampleROW,sampleCOL] = oneDirBasis(sample_dir,distinct,16);
% Create test sample of from excluded data 
sample = allSamples(sample_dir, distinct,sampleSubjects,sampleROW,sampleCOL);

count_misses = [];
%Test knn with basis with varying subject sizes
for i = 1:sampleSubjects
    [basis,total_basis_subjects,ROW,COL] = oneDirBasis(basis_dir,distinct,i);
    %Output Recognition Results
    class = knnclassify(sample,basis,group,1);
    [accuracy_rate(i,:),misses] = accuracy(class, sample_dir);
    temp = gestureCounter(misses,distinct);
    count_misses = vertcat(count_misses,temp);
end

% Graph Accuracy v. Basis Subject Size
accuracyPlot = graphAccuracy(accuracy_rate);
% Graph Missed Gesture Classification v. Basis Subject Size
missBar = gestureBar(count_misses);