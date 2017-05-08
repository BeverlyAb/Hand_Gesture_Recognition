function [ name ] = offset( index, s )
% Returns a the gesture as a string given an index and of the total number
% of samples contributed by a volunteer for each gesture
%NOTE: This only works based on the format of the Grouped Data folder!!
% (s = # of samples, EX 2 )   
    if(index(end) >= 1 && index(end) <= 18*s)
        name = 'fist   ';
    elseif (index(end) >= 18*s + 1 && index(end) <= 37*s)
        name = 'middle ';
    elseif (index(end) >= 37*s  + 1 && index(end) <= 55*s)
        name = 'pinky  ';
    elseif (index(end) >= 55*s  + 1 && index(end) <= 73*s)
        name = 'pointer';
    elseif (index(end) >= 73*s   + 1&& index(end) <= 90*s)
        name = 'thumb  ';
    else
        name = 'whoops ';
    end
end

