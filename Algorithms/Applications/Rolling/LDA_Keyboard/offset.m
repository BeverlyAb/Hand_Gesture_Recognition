function [ name ] = offset( index, s, volunteers )
% Returns a the gesture as a string given an index and of the total number
% of samples contributed by a volunteer for each gesture
%NOTE: This only works based on the format of the Grouped Data folder!!
% (s = # of samples, EX 2 )   
    if(index(end) >= 1 && index(end) <= volunteers*s)
        name = 'enter';
    elseif (index(end) >= volunteers*s + 1 && index(end) <= volunteers*s*2)
        name = 'i    ';
    elseif (index(end) >= volunteers*s*2 + 1 && index(end) <= volunteers*s*3)
        name = 'p    ';
    elseif (index(end) >= volunteers*s*3 +1 && index(end) <= volunteers*s*4)
        name = 'space';
    elseif (index(end) >= volunteers*s*4 + 1&& index(end) <= volunteers*s*5)
        name = 'u    ';
    end
end

