
% PROBLEM 4.11 %

% PART 1 %
b1 = [1,-1,-4,4]; 
a1 = [1,-11/4,13/8,-1/4]; 
[R,p,k] = residuez(b1,a1)

% PART 4 %
b4 = [0,0,1]; 
a4 = [1,2,1.25,0.25]; 
[R,p,k] = residuez(b4,a4)


% PROBLEM 4.21 %
set(0,'defaultfigurepaperposition',[0,0,7,5]);
b = [3/4 5/4 1 1 5/4 3/4]; a = [1 0];
n = 0:200; x = sin(pi*n/2)+5*cos(pi*n); 
y = filter(b,a,x);
Hf_1 = figure; 
set(Hf_1,'NumberTitle','off','Name','P0421c'); 
subplot(2,1,1); 
Hs = stem(n,x); 
set(Hs,'markersize',2); 
axis([-2 202 -7 6]); 
xlabel('n'); 
ylabel('x(n)');
title('x(n) = sin(\pi \times n / 2)+5 \times cos(\pi \times n)');
subplot(2,1,2);
Hs = stem(n,y); 
set(Hs,'markersize',2); 
axis([-2 202 -2 4]); xlabel('n'); 
ylabel('y(n)');
title('Output sequence after filtering');