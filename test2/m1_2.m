clc,clear,close all
N=16;
n=0:1:N-1;
k=0:1:N-1;
x1=cos(pi/4*n);
x2=sin(pi/8*n);
xn=x1+1i*x2;
Xk=fft(xn,16);
Xkx=conj(Xk);%È¡¹²éî
X1=1/2*(Xk+[Xkx(1),fliplr(Xkx(2:16))]);
X2=1/2*(Xk-[Xkx(1),fliplr(Xkx(2:16))]);
x11=ifft(X1,16);
x22=ifft(X2,16)*(-1i);

subplot(611)
stem(n,real(X1))
xlabel('k');
ylabel('real(X1)');

subplot(612)
stem(n,real(X2))
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
