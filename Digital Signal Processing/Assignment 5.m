w = 0:0.1*pi:pi;
h = 1-1 ./(2*exp(1i.*w));
mag = abs(h);
phase = angle(h) .* (180/pi);

plot(w,mag);
ylim([0 1.5])
title('Magnitude Response')
xlabel('w')
ylabel('Magnitude')
figure
plot(w,phase);
ylim([0 45])
title('Phase Response')
xlabel('w')
ylabel('Phase in Degrees')