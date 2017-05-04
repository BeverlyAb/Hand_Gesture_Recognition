function [ trunc ] = stringName( string )
%Parses gesture from string
    trunc = string;
    trunc = strtok(trunc,'.');
    temp = strsplit(trunc,'_');
    trunc = temp(1,3);
end

