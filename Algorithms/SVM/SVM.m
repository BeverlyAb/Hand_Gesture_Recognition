% Calculates the accuracacies of LDA overall and for each gesture
% individually
% https://www.mathworks.com/help/stats/fitcsvm.html
% https://www.mathworks.com/help/stats/fitcecoc.html (Error Correcting
% Output Codes)
%http://machinelearningmastery.com/linear-discriminant-analysis-for-machine-learning/
distinct = 5;
input_dir = 'C:\Users\Beverly\Documents\GitHub\Hand_Gesture_Recognition\Grouped_Data';
test_samp = 5;
train_samp = 5;
rank = 8;
volunteers = 18;
[train,test,training_COL] = dataProducer(input_dir,train_samp,test_samp);
% Basis of 5 different gestures 

% pretty arbitrary for loop, no string parsing; all based on Grouped_Data
% folder format; group must be cell
for i = 1 : training_COL
    group(i,:) = cellstr((offset(i, train_samp,volunteers)));
end
trainBasis = fitcecoc(train.',group);
[svmClass, score, cost] = predict(trainBasis, test.');

%convert back to char in order to use accuracy()
for i = 1 : training_COL
    char_group(i,:) = ((offset(i, train_samp,volunteers)));
end

%convert back to char in order to use accuracy()
temp = [];
for i = 1 : training_COL
    if (strlength(char(svmClass(i,:))) < 7) % # of char must add up to 7 'due to # of letters in pointer'
        temp = (char(svmClass(i,:)));
        while (strlength(temp) < 7)
            temp = horzcat(temp, ' ');
        end
        char_svmClass(i,:) = temp;
    else
        char_svmClass(i,:) = char(svmClass(i,:));
    end
end

% Get Accuracies
[SVM_DONE, each_SVM]= accuracy(char_group, char_svmClass, training_COL,distinct);
SVM_DONE