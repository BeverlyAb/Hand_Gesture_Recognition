try
    fclose(s1);
catch
end
s1 = serial('COM5','BaudRate',9600);
%set(s1,'InputBufferSize',1000);
set(s1,'Timeout',8);
fopen(s1);

%i = 1; 
% infinite loop
%while i < 50
%    data = fread(s1, 10)
%    i = i + 1;
%end
data = fread(s1, 100);
fclose(s1);
