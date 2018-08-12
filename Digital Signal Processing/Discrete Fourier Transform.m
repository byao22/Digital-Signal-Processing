function [Xk] = dft(xn,N)
% Computes Discrete Fourier Transform
% -----------------------------------
% [Xk] = dft(xn,N)
% Xk = DFT coeff. array over 0 <= k <= N-1 % xn = N-point finite-duration sequence
% N=LengthofDFT
%
n = [0:1:N-1];
k = [0:1:N-1];
WN = exp(-j*2*pi/N);
nk = n'*k;
WNnk = WN .^ nk;
Xk = xn * WNnk;
% row vector for n
% row vecor for k
% Wn factor
% creates a N by N matrix of nk values
% DFT matrix
% row vector for DFT coefficients