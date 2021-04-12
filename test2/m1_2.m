clc,clear,close all
N=16;
n=0:1:N-1;
k=0:1:N-1;
x1=cos(pi/4*n);
x2=sin(pi/8*n);
xn=x1+j*x2;

Xk=fft(xn,16);
Xk1=conj(Xk);
X1=1/2*(Xk+Xk1(mod(-k,N)+1));%这里用fliplr怎么不对？
X2=1/2*(Xk-Xk1(mod(-k,N)+1));
x11=ifft(X1,16);
x22=ifft(X2,16)*(-1i);

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
stem(n,abs(X1))
ylabel('abs(X1)');

subplot(715)
stem(n,abs(X2))
xlabel('k');
ylabel('abs(X2)');
subplot(716)
stem(n,x11)
ylabel('x11');
subplot(717)
stem(n,x22)
ylabel('x22');
xlabel('n');
