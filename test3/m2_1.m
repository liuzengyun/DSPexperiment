clc,clear,close all
Fs=64;
Ts=1/Fs;
N1=16;
N2=32;
N3=64;
n1=0:1:N1-1;
n2=0:1:N2-1;
n3=0:1:N3-1;
x1=cos(8*pi*n1*Ts)+cos(16*pi*n1*Ts)+cos(20*pi*n1*Ts);
x2=cos(8*pi*n2*Ts)+cos(16*pi*n2*Ts)+cos(20*pi*n2*Ts);
x3=cos(8*pi*n3*Ts)+cos(16*pi*n3*Ts)+cos(20*pi*n3*Ts);
X1=fft(x1,N1);
X2=fft(x2,N2);
X3=fft(x3,N3);
plot(n3,x3)
% subplot(311)
% stem(n1/N1/Ts,abs(X1)/max(abs(X1)));
% ylabel("X1  F=4");
% xlabel("fk(Hz)");
% subplot(312)
% stem(n2/N2/Ts,abs(X2)/max(abs(X2)));
% ylabel("X2  F=2");
% xlabel("fk(Hz)");
% subplot(313)
% stem(n3/N3/Ts,abs(X3)/max(abs(X3)));
% ylabel("X3  F=1");
% xlabel("fk(Hz)");
