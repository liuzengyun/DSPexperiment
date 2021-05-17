% 4.1
clc,clear,close all
N=50;  n=0:N-1;
Fs=3000; Ts=1/Fs;
fm1=cos(2*pi*30*n*Ts);
fm2=cos(2*pi*60*n*Ts);
fm3=cos(2*pi*120*n*Ts);
fc1=cos(2*pi*300*n*Ts);
fc2=cos(2*pi*600*n*Ts);
fc3=cos(2*pi*1200*n*Ts);
stnT=fm1.*fc1+fm2.*fc2+fm3.*fc3;
Sk=fft(stnT,N);
wk=2*pi/N*n;
subplot(2,1,1)
stem(wk/pi,abs(Sk)/max(abs(Sk)));
xlabel('f/Hz');
ylabel('류똑');
title('N=2000')
grid on
N=100;  n=0:N-1;
Fs=3000; Ts=1/Fs;
fm11=cos(2*pi*30*n*Ts);
fm22=cos(2*pi*60*n*Ts);
fm33=cos(2*pi*120*n*Ts);
fc11=cos(2*pi*300*n*Ts);
fc22=cos(2*pi*600*n*Ts);
fc33=cos(2*pi*1200*n*Ts);
stnT=fm11.*fc11+fm22.*fc22+fm33.*fc33;
Sk=fft(stnT,N);
wk=2*pi/N*n;
subplot(2,1,2)
stem(wk/pi,abs(Sk)/max(abs(Sk)));
xlabel('f/Hz');
ylabel('류똑');
title('N=2048')
grid on