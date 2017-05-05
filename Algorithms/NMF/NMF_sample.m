%   Beverly Abadines
%   CSE 535: Lab3 (Nov. 22, 2016)
%   This applies the Updating Rules for Non-Negative Matrix Factorization
%   to engender the base matrix (W), coefficient matrix (H), and dataset
%   matrix (V), to create images similar to the Fence_data.

load Fence_data;        % load the whole data set
data = artificial_data; % extract out the data

%   1a) Dimensions of Fence_data = 32 x 32 x 69 
dimData = size(data);      
%   1b) V = 1024 x 69  = (m x n)
V = reshape(data, 1024, 69);    % convert original data to two dimensional matrix

%   1c)
rank = 16;  % arbritarily define the number of bases
 
% initialize W, H
W = 2 * rand(1024,rank);    % (m x 16)                                                   
H = 2 * rand(rank, 69);     % (16 x n)

%   1d) define iteration criterion
iteration = 1000;

%   1e) Run NMF repeatedly until reaching iteration criterion
for ii = 1:iteration
   W = W.*(V*H')./(W*H*H'+ 1*10.^(-100));
   H = H.*(W'*V)./(W'*W*H + 1*10.^(-100)); % one shot removes truncation errors if done component wise
end

% Engenders V, which is a close copy of Fence_Data
V = W*H;

%figure(111) % Displays original Fence_Data
%for mm = 1:rank                                                           
%    subplot(sqrt(rank), sqrt(rank), mm);imshow(data(:,:,mm));
%end
%   2a and 2b) Display the Factor Matrices W and H using subplot() and
%   imshow()
%W = reshape(W,32,32,16);
%figure(222) % Displays W
%for mm = 1:rank
%    subplot(sqrt(rank), sqrt(rank),mm);imagesc(W(:,:,mm));  
    %subplot(sqrt(rank), sqrt(rank), mm);imshow(W(:,:,mm));
%    colormap(gray); axis off;
%end  

%H = reshape(H, 23, 3,16);
%figure(333) % Displays H
%for mm = 1:rank 
%    subplot(sqrt(rank),sqrt(rank),mm);imagesc(H(:,:,mm));  
    %subplot(sqrt(rank), sqrt(rank), mm);imshow(H(:,:,mm)); 
%    colormap(gray); axis off;
%end  

%V = reshape(V, 32,32, 69);
%figure(444) % Displays V
%for mm = 1:rank  
%    subplot(sqrt(rank), sqrt(rank), mm);imshow(V(:,:,mm)); 
%    colormap(gray); axis off;
%end  

