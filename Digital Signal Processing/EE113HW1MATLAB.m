% PROBLEM 2.8 %

% PART 2 %
n = linspace(-50, 50, 101);
x = sin(0.125*pi*n);
subplot(2,1,1);
plot(x);

y = dnsample(x,101,4);
subplot(2,1,2);
plot(y);
figure 

% PART 3 %
x = sin(0.5*pi*n);
subplot(2,1,1);
plot(x);

y = dnsample(x,101,4);
subplot(2,1,2);
plot(y);