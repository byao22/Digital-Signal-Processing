x = 0:1:99;
y1 = sin(2*pi*0.1*x);
y2 = sin(2*pi*0.4*x);
y3 = sin(2*pi*0.6*x);
y4 = sin(2*pi*0.9*x);
plot(x,y1)
grid on
figure
plot(x,y2)
figure
plot(x,y3)
figure
plot(x,y4)
figure

b = 0:1:99;
a1 = sin(2*pi*0.04*b)
plot(b,a1)
figure

c = 0:2:99;
a2 = sin(2*pi*0.04*c)
plot(c,a2)
