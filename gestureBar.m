function [ missBar ] = gestureBar( count )
%Displays a bar graph of each misses per gesture along varying Basis
%Subject Sizes
figure 
missBar = bar(count);
title('Missed Gesture Classification v. Basis Subject Size');
xlabel('Basis Size(n)');
ylabel('Gesture (fist, middle, pinky, pointer, thumb)');
end

