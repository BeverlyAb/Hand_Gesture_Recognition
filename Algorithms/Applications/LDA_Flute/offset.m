function [ name ] = offset( index, s, volunteers )
% Returns a the gesture as a string given an index and of the total number
% of samples contributed by a volunteer for each gesture
%NOTE: This only works based on the format of the Grouped Data folder!!
% (s = # of samples, EX 2 )   
    if(index(end) >= 1 && index(end) <= volunteers*s)
        name = 'B_flat ';
    elseif (index(end) >= volunteers*s + 1 && index(end) <= volunteers*s*2)
        name = 'B_nat  ';
    elseif (index(end) >= volunteers*s*2 + 1 && index(end) <= volunteers*s*3)
        name = 'C      ';
    elseif (index(end) >= volunteers*s*3 +1 && index(end) <= volunteers*s*4)
        name = 'D      ';
    elseif (index(end) >= volunteers*s*4 + 1&& index(end) <= volunteers*s*5)
        name = 'E      ';
    elseif (index(end) >= volunteers*s*5 + 1&& index(end) <= volunteers*s*6)
        name = 'E_flat ';
    elseif (index(end) >= volunteers*s*6 + 1&& index(end) <= volunteers*s*7)
        name = 'F      ';
    elseif (index(end) >= volunteers*s*7 + 1&& index(end) <= volunteers*s*8)
        name = 'G_flat ';    
    end

end

