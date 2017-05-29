function [ name ] = offset( index, s, volunteers )
% Returns a the gesture as a string given an index and of the total number
% of samples contributed by a volunteer for each gesture
%NOTE: This only works based on the format of the Grouped Data folder!!
% (s = # of samples, EX 2 )   
    if(index(end) >= 1 && index(end) <= volunteers*s)
        name = 'fist   ';
    elseif (index(end) >= volunteers*s + 1 && index(end) <= volunteers*s*2)
        name = 'middle ';
    elseif (index(end) >= volunteers*s*2 + 1 && index(end) <= volunteers*s*3)
        name = 'pinky  ';
    elseif (index(end) >= volunteers*s*3 +1 && index(end) <= volunteers*s*4)
        name = 'pointer';
    elseif (index(end) >= volunteers*s*4 + 1&& index(end) <= volunteers*s*5)
        name = 'thumb  ';
    else
        name = 'whoops ';
    end
end

