% EE113 HW 8 %

S1 = 0.2*pi;
P1 = 0.35*pi;
P2 = 0.55*pi;
S2 = 0.75*pi;
 Rp = 0.25;
 As = 40;
[delta1,delta2] = db2delta(Rp,As);
if (delta1 < delta2)
    delta2 = delta1; disp('delta1 is smaller')
    [Rp,As] = delta2db(delta1,delta2) 
end
tr_width = min((P1-S1),(S2-P2));
M = ceil(6.2*pi/tr_width); M = 2*floor(M/2)+1, 

n = 0:M-1; w_han = (hann(M))';
wc1 = (S1+P1)/2; wc2 = (S2+P2)/2; hd = ideal_lp(wc2,M)-ideal_lp(wc1,M); 
h = fir1(M-1,[wc1,wc2]/pi,'bandpass',w_han);

[db,mag,pha,grd,w] = freqz_m(h,1); delta_w = pi/500;
P = -min(db((P1/delta_w)+1:(P2/delta_w)+1)), 
A = floor(-max(db(1:(S1/delta_w)+1))),

figure;
subplot(2,2,1); G= stem(n,hd,'filled');  
title('Ideal Impulse Response'); 
axis([-1,M,min(hd)-0.1,max(hd)+0.1]); 
xlabel('n'); 
ylabel('hd(n)'); 
subplot(2,2,2); 
G = stem(n,w_han,'filled'); 
axis([-1,M,-0.1,1.1]); 
xlabel('n'); 
ylabel('w_{han}(n)'); 
title('Hann Window'); 
subplot(2,2,3); 
G = stem(n,h,'filled'); 
title('Actual Impulse Response');  
axis([-1,M,min(hd)-0.1,max(hd)+0.1]); 
xlabel('n'); 
ylabel('h(n)'); 
subplot(2,2,4); 
plot(w/pi,db,'linewidth',1); 
title('Mag Response (dB)'); 
axis([0,1,-As-30,5]); 
xlabel('\omega/\pi'); 
ylabel('Decibels');

