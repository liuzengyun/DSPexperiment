clc,clear,close all
N=16;
n=0:1:N-1;
x1=cos(pi/4*n);
x2=sin(pi/8*n);
xn=x1+x2;
% M=1000;
% k=0:1:M-1;
% w=2*pi/M*k;
% Xejw=dtft(x1,w);
Xk=fft(xn,16);
X1=real(Xk);
X2=imag(fft(xn,16));
X22=fft(x2,16);
x11=ifft(X1,16);
x22=ifft(j*X2,16);

subplot(711)
stem(n,x1);
ylabel('x1');
subplot(712)
stem(n,x2);
ylabel('x2');
xlabel('n');
subplot(713)
stem(n,abs(Xk))
ylabel('abs(Xk)');
subplot(714)
stem(n,X1)
ylabel('X1');
subplot(715)
stem(n,X2)
xlabel('k');
ylabel('X2');
subplot(716)
stem(n,x11)
ylabel('x11');
subplot(717)
stem(n,x22)
ylabel('x22');
xlabel('n'); 
