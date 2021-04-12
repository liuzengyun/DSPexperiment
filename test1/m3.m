clc,clear,close all
xn=[1,1,1,1];
M=1000;
k=0:1:M-1;
w=6*pi/M*k;
Xejw=dtft(xn,w);
% subplot(511);
plot(w/pi,abs(Xejw));
ylabel('X(ejw)'); 
xlabel('\omega/\pi');
