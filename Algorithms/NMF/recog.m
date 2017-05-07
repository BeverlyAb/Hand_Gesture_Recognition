function [names ] = recog( calc, actual, input_dir, n )
input_dir = 'C:\Users\Beverly\Documents\GitHub\Hand_Gesture_Recognition\All_Data';
%Compares the calculated values with the test samples and to attempt to recognize 
%the most likely gesture (string). 
filenames = dir(fullfile(input_dir,'*csv'));   
for i = 1 : n
    differ(1,:) = abs(calc(1,i) - actual(1,:));
    for j = 1 : n
       if(differ(1,j) == min(differ))
           index = j;       
           break;
       end
   end
   names(i,:) = (offset(index, 2));
end
end