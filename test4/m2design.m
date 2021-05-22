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

% ȷ�������˲������ָ��
ap=0.1; as=60;
Wp1=2*pi*340*Ts; Ws1=2*pi*350*Ts;% ��ͨ
Wp2=[2*pi*500*Ts,2*pi*700*Ts]; Ws2=[2*pi*450*Ts,2*pi*750*Ts];% ��ͨ
Wp3=2*pi*1000*Ts; Ws3=2*pi*950*Ts;% ��ͨ

% ����˲���,
[N1,wp1]=ellipord(Wp1/pi,Ws1/pi,ap,as); % ��ͨ
[N2,wp2]=ellipord(Wp2/pi,Ws2/pi,ap,as); % ��ͨ
[N3,wp3]=ellipord(Wp3/pi,Ws3/pi,ap,as); % ��ͨ
[Bz1,Az1]=ellip(N1,ap,as,wp1);  % ��ͨ
[Bz2,Az2]=ellip(N2,ap,as,wp2);  % ��ͨ
[Bz3,Az3]=ellip(N3,ap,as,wp3,'high');   % ��ͨ

% ����ĺ���
[H1,w1]=freqz(Bz1,Az1,1024);
[H2,w2]=freqz(Bz2,Az2,1024);
[H3,w3]=freqz(Bz3,Az3,1024);
subplot(321)
plot(w1/pi,20*log10(abs(H1)/max(abs(H1))));
title('��ͨ�˲�����ĺ���')
xlabel('w/\pi');
ylabel('dB');
grid on
subplot(323)
plot(w2/pi,20*log10(abs(H2)/max(abs(H2))));
title('��ͨ�˲�����ĺ���')
xlabel('w/\pi');
ylabel('dB');
grid on
subplot(325)
plot(w3/pi,20*log10(abs(H3)/max(abs(H3))));
title('��ͨ�˲�����ĺ���')
xlabel('w/\pi');
ylabel('dB');
grid on

% ���źŲ���
y1=filter(Bz1,Az1,stnT);  
y2=filter(Bz2,Az2,stnT);
y3=filter(Bz3,Az3,stnT);
subplot(422)
plot(t,st)
xlabel('t');
ylabel('st');
grid on
subplot(424)
plot(n*Ts,y1)
xlabel('t');
ylabel('y1');
grid on
subplot(426)
plot(n*Ts,y2)
xlabel('t');
ylabel('y2');
grid on
subplot(428)
plot(n*Ts,y3)
xlabel('t');
ylabel('y3');
grid on



