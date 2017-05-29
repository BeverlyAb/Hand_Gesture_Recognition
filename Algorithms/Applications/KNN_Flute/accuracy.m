function [ overall_accuracy, each_acc] = accuracy( test_names, calc_names, num_samples, distinct )
% Outputs accuracy between test names (strings) and caluculated  names
% given a shared number of samples
    correct = 0;
    %count = zeros(1,distinct);
    count = zeros(1,distinct);
    if (distinct == 8)
      % Basis of 8 different gestures 
group = [   'B_flat';
            'B     ';
            'C     ';
            'D     ';
            'E     ';
            'E_flat'; 
            'F     ';
            'G_flat'];  
    end
       %else specify other gestures by hardcoding it
       
    for n = 1 :num_samples
        if(test_names(n,:) == calc_names(n,:))
            correct = correct + 1;
        else
            if(test_names(n,:) == 'B_flat')
                count(1,1) = count(1,1) + 1;
            elseif(test_names(n,:) == 'B     ')
                count(1,2) = count(1,2) + 1;
            elseif(test_names(n,:) == 'C     ')
                count(1,3) = count(1,3) + 1;
            elseif(test_names(n,:) == 'D     ')
                count(1,4) = count(1,4) + 1;
            elseif(test_names(n,:) == 'E     ')
                count(1,5) = count(1,5) + 1;
            elseif(test_names(n,:) == 'E_flat')
                count(1,6) = count(1,6) + 1;
            elseif(test_names(n,:) == 'F     ')
                count(1,7) = count(1,7) + 1;
            elseif(test_names(n,:) == 'G_flat')
                count(1,8) = count(1,8) + 1;    
           end
        end
    end
 
    buffer = zeros(1);
    for i = 1 : distinct
        each_acc(1,i) = 1 - (count(1,i) / num_samples) ;
        buffer = each_acc(1,i) + buffer;
    end
    overall_accuracy = buffer / distinct;
end

