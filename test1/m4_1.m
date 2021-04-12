clc,clear,close all
xn=[1,1,1,1];
M=1000;
k=0:1:M-1;
x1=[xn,zeros(1,28)];
w1=2*pi/1000*k;
X=dtft(xn,w1);
subplot(211);
plot(w1/pi,abs(X));
ylabel('X'); 
subplot(212);
X1=dtft(x1,w1);
plot(w1/pi,abs(X1));
ylabel('X1'); 
xlabel('\omega/\pi'); 