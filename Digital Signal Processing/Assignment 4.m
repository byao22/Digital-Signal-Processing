% PROBLEM 5.10 %

% PART 3 %

n3 = [0:50]; 
x3 = cos(0.5*pi*n3) + j*sin(0.5*pi*n3);
N = 500;

N3 = length(n3); 
x3 = [x3, zeros(1, N-N3)];
[X3] = dft(x3,N);
w = (0:N/2)*2*pi/N;
mag_X3 = abs(X3(1:N/2+1));
pha_X3 = angle(X3(1:N/2+1))*180/pi;
figure;
subplot(2,1,1);
plot(w/pi,mag_X3,'g','linewidth',1);
subplot(2,1,2); 
plot(w/pi,pha_X3, 'g','linewidth',1);
axis([0,1,-200,200]);


% PART 4 % 
n4 = [-3:3]; 
x4 = [1,2,3,4,3,2,1];
N4 = length(n4);
N = 100;
[X4] = dft([x4, zeros(1,N-N4)],N);
w = (0:N/2)*2*pi/N;
mag_X4 = abs(X4(1:N/2+1));
pha_X4 = angle(X4(1:N/2+1))*180/pi;
figure;
subplot(2,2,1);
plot(w/pi,mag_X4, 'g','linewidth',1);
axis([0,1,0,20]);
subplot(2,1,2);
plot(w/pi,pha_X4,'g','linewidth',1);
axis([0,1,-200,200]);


