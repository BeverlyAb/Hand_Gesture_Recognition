function [ count ] = gestureCounter( miss_array, distinct, sampleSize )
%Counts the number of incorrect classifications per distinct gesture
    count = zeros(1,distinct);
    if (distinct == 5)
      group = ['fist   ';'middle ';'pinky  ';'pointer';'thumb  '];    
    end
   %else specify other gestures by hardcoding it
    
    num_misses = numel(miss_array);
    for i = 1: num_misses
        gesture = strtrim(miss_array(:,i));
        if(gesture == strtrim(group(1,:)))
            count(1,1) = count(1,1) + 1;
        elseif(gesture == strtrim(group(2,:)))
            count(1,2) = count(1,2) + 1;
        elseif(gesture == strtrim(group(3,:)))
            count(1,3) = count(1,3) + 1;
        elseif(gesture == strtrim(group(4,:)))
            count(1,4) = count(1,4) + 1;
        else %(gesture == group(1,5))
            count(1,5) = count(1,5) + 1;
        end
    end
    
    for i = 1: distinct
        count(1,i) = (sampleSize - count(1,i)) / sampleSize;
    end
end
