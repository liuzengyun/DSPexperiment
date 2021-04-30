clc,clear,close all
Ts=1/64;
N1=128;
N2=512;
N3=2048;
n1=0:1:N1-1;
n2=0:1:N2-1;
n3=0:1:N3-1;
x1=cos(8*pi*n1*Ts)+cos(16*pi*n1*Ts)+cos(20*pi*n1*Ts);
x2=cos(8*pi*n2*Ts)+cos(16*pi*n2*Ts)+cos(20*pi*n2*Ts);
x3=cos(8*pi*n3*Ts)+cos(16*pi*n3*Ts)+cos(20*pi*n3*Ts);
X1=fft(x1,N1);
X2=fft(x2,N2);
X3=fft(x3,N3);
PSD1=X1.*conj(X1)/N1;
PSD2=X2.*conj(X2)/N2;
PSD3=X3.*conj(X3)/N3;
subplot(311)
plot(n1/N1/Ts,abs(PSD1));
ylabel("PSD(DB)  F=1");
xlabel("fk(Hz)");
subplot(312)
plot(n2/N2/Ts,abs(PSD2));
ylabel("PSD(DB)  F=0.5");
xlabel("fk(Hz)");
subplot(313)
plot(n3/N3/Ts,abs(PSD3));
ylabel("PSD(DB)  F=0.25");
xlabel("fk(Hz)");
