sample_dir = 'C:\Users\Beverly\Documents\GitHub\Hand_Gesture_Recognition\Sample_Testing';
basis_dir = 'C:\Users\Beverly\Documents\GitHub\Hand_Gesture_Recognition\Training_Basis';
distinct = 5;

% Basis of 5 different gestures from a large sample
[basis,subjects,ROW,COL] = oneDirBasis(basis_dir,distinct,14);    
group = ['fist   ';'middle ';'pinky  ';'pointer';'thumb  '];    

%call basis to receive subject, ROW, and COL from sample_dir
[~,sampleSubjects,sampleROW,sampleCOL] = oneDirBasis(sample_dir,distinct,16);
% Create test sample of from excluded data 
sample = allSamples(sample_dir, distinct,sampleSubjects,sampleROW,sampleCOL);

%Output Recognition Results
class = knnclassify(sample,basis,group,1);
[accuracy_rate, missed] = accuracy(class, sample_dir)