%http://stackoverflow.com/questions/17435510/calculating-the-covariance-of-a-1000-5x5-matrices-in-matlab
% returns 3 dimensional covariance
function[xy]= cov3d(x)
[m,n,p] = size(x);
if m == 1
    x = zeros(n,n,p,class(x));
else
    xc = bsxfun(@minus,x,sum(x,1)/m);
    for i = 1:p
        xci = xc(:,:,i);
        xy(:,:,i) = xci'*xci;
    end
    xy = xy/(m-1);
end