
%PART 1%
function [y,m] = dnsample(x,n,M)
% Downsample sequence x(n) by a factor of M to obtain y(m)
m=1; 

% downsample %
for k=1:(M):n 
    y(m)=x(k);
    m=m+1;
end
m=m-1;
end