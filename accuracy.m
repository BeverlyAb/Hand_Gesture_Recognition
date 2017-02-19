function [ fraction,incorrect] = accuracy( class, sample_test_dir )
% Outputs the accuracy of the gesture recognition, based on the file
% names from the training basis folder and knn class output. This also returns an array
% of the misidentified gestures. Note this also calls gestureName.m
    correct = 0;
    wrong = 0;
    incorrect = string('');
    [num_samples, ~] = size(dir(fullfile(sample_test_dir,'*csv')));   
    for n = 1 :num_samples
        % if matrix dimensions don't agree then the gesture name
        % and identified gesture do not match
        [~,gN_COL]=size(gestureName(sample_test_dir, n));
        [~,c_COL] = size(strtrim(class(n,:)));
        
        % matrix dimension may match, but is it necessarily the correct
        % gesture?
        if((gN_COL == c_COL) & (gestureName(sample_test_dir, n) == strtrim(class(n,:))))
            correct = correct + 1;
        else
            wrong = wrong + 1;
            incorrect(wrong) = string(gestureName(sample_test_dir, n));     
        end        
    end
    fraction = correct / num_samples;
end

