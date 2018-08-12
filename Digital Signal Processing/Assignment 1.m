% PROBLEM 2.16 %

% PART 1 %

n = 0:50;
% analytically %
y = ((-0.9).^n.*(1-(-8/9).^(n+1)))/(1+8/9);
subplot(1,3,1);
stem(y);
title('Analytically') 

% PART 2 %
h = 0:25;
g = 0.8.^h;
j = (-0.9).^h;

k = conv(g,j);
subplot(1,3,2);
stem(k);
title('Conv')

% PART 3 %
H = 0:50;
G = 0.8.^H;
J = (-0.9).^H;
K = filter(J,1,G);
subplot(1,3,3);
stem(K);
title('Filter')

