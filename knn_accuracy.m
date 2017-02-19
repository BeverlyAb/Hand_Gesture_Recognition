%Creates a Training Basis and Testing Sample from a single directory with 
% exclusive DATA only. This develops an accuracy plot and bar graph of misidentified gestures
% with respect to varying Basis subject sizes. 

myDir = 'C:\Users\Beverly\Documents\GitHub\Hand_Gesture_Recognition\All_Data';
distinct = 5;

% Basis of 5 different gestures 
group = ['fist   ';'middle ';'pinky  ';'pointer';'thumb  '];    

%call basis to receive subject, ROW, and COL from myDir
[~,sampleSubjects,sampleROW,sampleCOL] = oneDirBasis(myDir,distinct,16);
% Create test sample of from excluded data 
sample = allSamples(myDir, distinct,sampleSubjects,sampleROW,sampleCOL);

count_misses = [];
%Test knn with basis with varying subject sizes
for i = 1:sampleSubjects
    [basis,total_basis_subjects,ROW,COL] = oneDirBasis(myDir,distinct,i);
    %Output Recognition Results
    class = knnclassify(sample,basis,group,1);
    [accuracy_rate(i,:),misses] = accuracy(class, myDir);
    temp = gestureCounter(misses,distinct);
    count_misses = vertcat(count_misses,temp);
end

% Graph Accuracy v. Basis Subject Size
accuracyPlot = graphAccuracy(accuracy_rate);
% Graph Missed Gesture Classification v. Basis Subject Size
missBar = gestureBar(count_misses);
