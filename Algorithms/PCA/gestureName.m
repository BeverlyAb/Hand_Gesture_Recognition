function [ name ] = gestureName( directory, index )
%Returns the name of the gesture based on the file name
    trunc = dir(fullfile(directory,'*csv'));
    trunc = trunc(index).name;
    % splits into a 1 x 3 cell array of Firstname, Initial, and Gesture
    trunc = strsplit(trunc,'_');  
    name = trunc{1,3};
    % returns only Gesture by removing '.csv' 
    name = char(name);
    name = name(1:end-4);
end

