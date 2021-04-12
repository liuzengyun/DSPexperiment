clc,clear,close all
xn=[1,1,1,1];
M=4;
k=0:1:M-1;
N=1000;
k1=0:1:N-1;
w1=2*pi/1000*k1;
X1=dtft(xn,w1);
Xk1=dft(xn,M);
subplot(211);
plot(w1/pi,abs(X1));
hold on,grid on
stem(2/M*k,abs(Xk1));
ylabel('Xk1'); 
M=32;
k=0:1:M-1;
Xk2=dft(xn,M);
subplot(212);
plot(w1/pi,abs(X1));
hold on,grid on
stem(2/M*k,abs(Xk2));
xlabel('\omega/\pi'); 
ylabel('Xk2');
