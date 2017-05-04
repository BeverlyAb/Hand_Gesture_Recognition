function [trunc] = name(match_ix, pathfile)
% returns a string of the picture
% from the pathfile directory
    trunc = pathfile(match_ix).name; 
end
