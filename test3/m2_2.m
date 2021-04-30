clc,clear,close all
Ts=1/64;
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
P1=X1.*conj(X1)/N1;
P2=X2.*conj(X2)/N2;
P3=X3.*conj(X3)/N3;
subplot(311)
plot(n1/N1/Ts,abs(P1));
ylabel("P1(DB) F=4");
xlabel("fk(Hz)");
subplot(312)
plot(n2/N2/Ts,abs(P2));
ylabel("P2(DB) F=2");
xlabel("fk(Hz)");
subplot(313)
plot(n3/N3/Ts,abs(P3));
ylabel("P3(DB) F=1");
xlabel("fk(Hz)");
