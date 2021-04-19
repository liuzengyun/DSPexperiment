clc,clear,close all
N=16;
n=0:1:N-1;
x1=cos(pi/4*n);
x2=sin(pi/8*n);
xn=x1+x2;
Xk=fft(xn,16);
X1=real(Xk);
X2=imag(Xk);
x11=ifft(X1,16);
x22=ifft(1i*X2,16);

subplot(611)
stem(n,X1)
xlabel('k');
ylabel('real(X2)');

subplot(612)
stem(n,X2)
xlabel('k');
ylabel('real(X2)');

subplot(613)
stem(n,x1);
xlabel('n');
ylabel('x1');

subplot(614)
stem(n,x11);
xlabel('n');
ylabel('x1»Ö¸´');

subplot(615)
stem(n,x2);
xlabel('n');
ylabel('x2');

subplot(616)
stem(n,x22);
xlabel('n');
ylabel('x2»Ö¸´');

