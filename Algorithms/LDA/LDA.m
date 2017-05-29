% Calculates the accuracacies of LDA overall and for each gesture
% individually
%https://www.mathworks.com/help/stats/examples/classification.html
%http://machinelearningmastery.com/linear-discriminant-analysis-for-machine-learning/
distinct = 5;
input_dir = 'C:\Users\Beverly\Documents\GitHub\Hand_Gesture_Recognition\Grouped_Data';
test_samp = 5;
train_samp = 5;
rank = 8;
volunteers = 18; 
[train,test,training_COL] = dataProducer(input_dir,train_samp,test_samp);

% pretty arbitrary for loop, no string parsing; all based on Grouped_Data
% folder format; group must be cell
for i = 1 : training_COL
    group(i,:) = cellstr((offset(i, train_samp,volunteers)));
end
lda = fitcdiscr(train.',group);
%label results 
[ldaClass, score, cost] =predict(lda,test.');

%convert back to char in order to use accuracy()
for i = 1 : training_COL
    char_group(i,:) = ((offset(i, train_samp,volunteers)));
end

%convert back to char in order to use accuracy()
temp = [];
for i = 1 : training_COL
    if (strlength(char(ldaClass(i,:))) < 7) % # of char must add up to 7 'due to # of letters in pointer'
        temp = (char(ldaClass(i,:)));
        while (strlength(temp) < 7)
            temp = horzcat(temp, ' ');
        end
        char_ldaClass(i,:) = temp;
    else
        char_ldaClass(i,:) = char(ldaClass(i,:));
    end
end

% Get Accuracies
[LDA_DONE, each_LDA]= accuracy(char_group, char_ldaClass, training_COL,distinct);
LDA_DONE