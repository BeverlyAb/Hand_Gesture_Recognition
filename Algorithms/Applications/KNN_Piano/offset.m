function [ name ] = offset( index, s, volunteers )
% Returns a the gesture as a string given an index and of the total number
% of samples contributed by a volunteer for each gesture
%NOTE: This only works based on the format of the Grouped Data folder!!
% (s = # of samples, EX 2 )   
    if(index(end) >= 1 && index(end) <= volunteers*s)
        name = 'A_chord_sustained  ';
    elseif (index(end) >= volunteers*s + 1 && index(end) <= volunteers*s*2)
        name = 'B_chord_sustained  ';
    elseif (index(end) >= volunteers*s*2 + 1 && index(end) <= volunteers*s*3)
        name = 'C_chord_sustained  ';
    elseif (index(end) >= volunteers*s*3 +1 && index(end) <= volunteers*s*4)
        name = 'C_thumb_sustained  ';
    elseif (index(end) >= volunteers*s*4 + 1&& index(end) <= volunteers*s*5)
        name = 'D_pointer_sustained';
    elseif (index(end) >= volunteers*s*5 + 1&& index(end) <= volunteers*s*6)
        name = 'E_middle_sustained ';
    elseif (index(end) >= volunteers*s*6 + 1&& index(end) <= volunteers*s*7)
        name = 'F_ring_sustained   ';
    elseif (index(end) >= volunteers*s*7 + 1&& index(end) <= volunteers*s*8)
        name = 'G_pinky_sustained  ';    
    end

end

