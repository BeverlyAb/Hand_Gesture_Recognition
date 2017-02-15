sample_dir = 'C:\Users\Beverly\Desktop\CSE_classes\Senior_Project\Sample_Testing';
basis_dir = 'C:\Users\Beverly\Desktop\CSE_classes\Senior_Project\Training_Basis';
distinct = 5;

% Basis of 5 different gestures from a large sample
[basis,subjects,ROW,COL] = oneDirBasis(basis_dir,distinct);    
group = ['fist   ';'middle ';'pinky  ';'pointer';'thumb  '];    

%call basis to receive subject, ROW, and COL from sample_dir
[~,sampleSubjects,sampleROW,sampleCOL] = oneDirBasis(sample_dir,distinct);
% Create test sample of from excluded data 
sample = allSamples(sample_dir, distinct,sampleSubjects,sampleROW,sampleCOL);

%Output Recognition Results
class = knnclassify(sample,basis,group,1);
[accuracy_rate, missed] = accuracy(class, sample_dir)