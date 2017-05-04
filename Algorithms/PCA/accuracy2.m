function [ fraction,actual, calculated, incorrect] = accuracy2( class, test_dir, samplesize )
% Outputs the accuracy of the gesture recognition, based on the file
% names from the training basis folder and knn class output. This also returns an array
% of the correct gestures. Note this also calls gestureName.m
    correct = 0;
    wrong = 0;
    incorrect = string('');
    [num_samples, ~] = size(dir(fullfile(test_dir,'*csv')));
    start = num_samples - samplesize*5;
    i = 1;
    for n = start + 1:num_samples
        % if matrix dimensions don't agree then the gesture name
        % and identified gesture do not match
        if (i < samplesize*5)
            i = i + 1; % processing of i = i + 1 is too fast compared to other code in for loop 
        end
        [~,gN_COL]=size(gestureName(test_dir, n));
        [~,c_COL] = size(strtrim(class(i,:)));
        % matrix dimension may match, but is it necessarily the correct
        % gesture?
        gestureName(test_dir, n);
        actual(i,:) = string(gestureName(test_dir, n));
        calculated(i,:) = stringName(class(i,:));
        if((gN_COL == c_COL) & (gestureName(test_dir, n) == stringName(class(i,:))))
            correct = correct + 1;
        else
            wrong = wrong + 1;
            incorrect(wrong) = string(gestureName(test_dir, n));     
        end       
        
    end
    fraction = correct / num_samples;
end

