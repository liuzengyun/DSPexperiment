clc,clear,close all
format compact
N=16;
n=0:1:N-1;
k=0:1:7;
XK_in=[1+1i,-3-1i,-3+3*1i,-1-3*1i];
XKf=conj(fliplr(XK_in)); 
Xk=[0,XK_in,0,0,0,0,0,0,0,XKf];

subplot(211)
stem(n,real(Xk));
xlabel('k');
ylabel('real(Xk)');
subplot(212)
stem(n,imag(Xk));
xlabel('k');
ylabel('imag(Xk)');
