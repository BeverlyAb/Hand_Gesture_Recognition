function [ fraction] = NMF_accuracy( test_names, calc_names, num_samples )
% Outputs accuracy between test names (strings) and caluculated  names
% given a shared number of samples
    correct = 0;
    for n = 1 :num_samples
        if(test_names(n,:) == calc_names(n,:))
            correct = correct + 1;
        end
    end
    fraction = correct / num_samples;
end

