% Problem 2.19 %

% Part 1 %

s = [1,-0.5,0.25];
d = [1,2,1];
x = impseq(0,0,100);

f = [0:100];
k = filter(d,s,x);
subplot(2,1,1);
stem(f,k);

% Part 2 %
z = roots(s);
magz=abs(z);

% Part 3 %
f = [0:200];
x = (5+3*cos(2*pi*f)+4*sin(0.6*pi*f));
y = filter(d,s,x);
subplot(2,1,2);
stem(f,y);

function [x,n] = impseq(n0,n1,n2)

if ((n0 < n1) | (n0 > n2) | (n1 > n2))

	error('arguments must satisfy n1 <= n0 <= n2')

    end

f = [n1:n2];
x = [(f-n0) == 0];
end

% Problem 3.16 %

function [H] = freqresp(b,a,w)

con1 = length(a);

con2 = length(d);

num = 0;
num2 = 1;
for i = 0: con2
    num = num + d(i+1)*exp(-j*w*i);
end

for i = 0: con1
    num2 = num2 + a(i+1)*exp(-j*w*i);
end

H = num./num2;
end

