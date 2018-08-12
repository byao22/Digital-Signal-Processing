
% PROBLEM 9.7 %
n2 = 0:100;
x2 = cos(0.1*pi*n2) + cos(0.4*pi*n2);
n21 = downsample(n2, 4, 0);
y21 = decimate(x2, 4);
figure;
H_stem2 = stem(n21, y21, 'r', 'filled');
y22 = decimate(x2, 4, 'FIR');
figure;
H_stem2_FIR = stem(n21, y22, 'r', 'filled');
y23 = decimate(x2, 4, 'IIR');
figure;
H_stem2_IIR = stem(n21, y23, 'r', 'filled');


n3 = 0:100;
x3 = 1 - cos(0.25*pi*n3);
n31 = downsample(n3, 4, 0);
y31 = decimate(x3, 4);
figure;
H_stem3 = stem(n31, y31, 'r', 'filled');
y32 = decimate(x3, 4, 'FIR');
figure;
H_stem3_FIR = stem(n31, y32, 'r', 'filled');
y33 = decimate(x3, 4, 'IIR');
figure;
H_stem3_IIR = stem(n31, y33, 'r', 'filled');


% PROBLEM 9.12 %
n2 = 0:25;
x2 = sin(0.8*pi*n2) + cos(0.5*pi*n2);
figure;
stem(n2,x2)

I = 4;
n21 = 0:(n2(end)+1)*I - 1; 
% Offset of 0 %
y21 = upsample(x2, I, 0);
figure;
stem(n21,y21)

n22 = [0:(n2(end)+1)*I-1]-2;
% Offset of 2 %
y22 = upsample(x2, I, 2);
figure;
stem(n22,y22)

% PROBLEM 9.14 %

% For x2 %
figure;
h2 = interp(x2,4);
stem(h2)


figure;
h3 = interp(x2, 3);
stem(h3)

figure;
h4 = interp(x2, 5);
stem(h4)

% For y2 %
N = 3;
M = 5;

m21 = 0:(n2(end)+1)*N - 1; 
k21 = upsample(x2, N, 0);
figure;
h21 = interp(k21,4,3);
stem(h21)

figure;
h22 = interp(y21,4,5);
stem(h22)
