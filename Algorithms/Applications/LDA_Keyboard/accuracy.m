function [ overall_accuracy, each_acc] = accuracy( test_names, calc_names, num_samples, distinct )
% Outputs accuracy between test names (strings) and caluculated  names
% given a shared number of samples
    correct = 0;
    %count = zeros(1,distinct);
    count = zeros(1,distinct);
    if (distinct == 5)
      group = ['fist   ';'middle ';'pinky  ';'pointer';'thumb  '];    
    end
       %else specify other gestures by hardcoding it
       
    for n = 1 :num_samples
        if(test_names(n,:) == calc_names(n,:))
            correct = correct + 1;
        else
            if(test_names(n,:) == 'fist   ' )
                count(1,1) = count(1,1) + 1;
            elseif(test_names(n,:) == 'middle ')
                count(1,2) = count(1,2) + 1;
            elseif(test_names(n,:) == 'pinky  ')
                count(1,3) = count(1,3) + 1;
            elseif(test_names(n,:) == 'pointer')
                count(1,4) = count(1,4) + 1;
            else %(test_names(n,:) == 'thumb  ')
                count(1,5) = count(1,5) + 1;
            end
           n
        end
    end
 
    buffer = zeros(1);
    for i = 1 : distinct
        count
        each_acc(1,i) = 1 - (count(1,i) / num_samples) ;
        buffer = each_acc(1,i) + buffer;
    end
    overall_accuracy = buffer / distinct;
end

