function [ sample] = allSamples( directory, distinct,subjects,ROW,COL )
% Creates a sample testing from data excluded from the training basis. 
    sampleBasis = dir(fullfile(directory,'*csv'));
    num_files = numel(sampleBasis); 
    
    % check to see if there is only one subject
    if(num_files ~= distinct)
        for n = 1: num_files
            %removes name(row) and time(col), and only includes the subsequent
            %rows excluded from the training basis
            sample_files = (csvread(fullfile(directory, sampleBasis(n).name),int8(ROW/subjects)+1,1));
            sample(n,:) = sum(sample_files);
        end
    else
        for n = 1: distinct
            %removes name(row) and time(col), and only includes the subsequent
            %rows excluded from the training basis
            sample_files = (csvread(fullfile(directory, sampleBasis(n).name),1,1));
            sample(n,:) = sum(sample_files);
        end
    end
end

