clc,clear,close all

% ������·�����źŹ��ɵ�FDMʱ�����ź�st
t=0:0.001:1;
fm1=cos(2*pi*30*t);
fm2=cos(2*pi*60*t);
fm3=cos(2*pi*120*t);
f1=cos(2*pi*300*t);
f2=cos(2*pi*600*t);
f3=cos(2*pi*1200*t);
st=fm1.*f1+fm2.*f2+fm3.*f3;
subplot(211)
plot(t,st);
xlabel('t');
ylabel('st');
title('FDM�����ź�st')
grid on

% FDM�����ź�st��Ƶ�׷���
N=2048;
n=0:N-1;
Fs=4096;
Ts=1/Fs;
fm11=cos(2*pi*30*n*Ts);
fm22=cos(2*pi*60*n*Ts);
fm33=cos(2*pi*120*n*Ts);
f11=cos(2*pi*300*n*Ts);
f22=cos(2*pi*600*n*Ts);
f33=cos(2*pi*1200*n*Ts);
stnT=fm11.*f11+fm22.*f22+fm33.*f33;
Sk=fft(stnT,N);
wk=2*pi/N*n;
subplot(212)
stem(wk/pi,abs(Sk)/max(abs(Sk)));
xlabel('w/\pi');
ylabel('Sk');
title('FDM�ź�Ƶ����')
grid on


