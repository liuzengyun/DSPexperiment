clc,clear,close all
% ���ֵ�ͨ����ָ��
wp=0.2*pi;
ws=0.3*pi;
ap=1;
as=15;
T=0.01;

% ����ʱ���ź�xt��Ҫ�����xt��ʱ����ͼ
f1=5; f2=30;
t=0:0.001:1;
xt=sin(2*pi*f1*t)+0.5*cos(2*pi*f2*t);
subplot(221)
plot(t,xt)
xlabel('t');
ylabel('xt');
title('ʱ���ź�xt')
grid on

% xt��Ƶ�׷��� 
N=64;
Fs=64;
Ts=1/Fs;
k=0:N-1;
xnT=sin(2*pi*f1*k*Ts)+0.5*cos(2*pi*f2*k*Ts);
Xk=fft(xnT,N);
wk=2*pi/N*k;% k��Ӧ������Ƶ��
subplot(222)
stem(wk/pi,abs(Xk)/max(abs(Xk)));   %Ϊ�������ֵ��任����N�仯��ȱ�㣬��ͼʱ�ɹ�һ�������ס� 
xlabel('w/\pi');
ylabel('xnT');
title('Xk')
grid on

% ����˫���Ա任����Ƶ��ת����ʽ�õ�ģ���˲�����Ƶ��
Wp=(2/Ts)*tan(wp/2);
Ws=(2/Ts)*tan(ws/2);

% IIR �����˲�������Ƽ�ʵ��
[NN,Wc]=buttord(Wp,Ws,ap,as,'s');  %֮ǰ�ù�N������ʹ��NN��ʾ����  
[B,A]=butter(NN,Wc,'s');
[Bz,Az]=bilinear(B,A,Fs);
[H,w]=freqz(Bz,Az,NN);
subplot(223);
plot(w/pi,20*log10(abs(H)/max(abs(H))))
xlabel('w/\pi');
ylabel('dB');
title('��ĺ���')
grid on

% �˲����ʱ����ͼ
subplot(224);
yt=filter(Bz,Az,xnT);
plot(k*Ts,yt)
title('�˲����źŵ�ʱ����')
xlabel('t');
ylabel('yt');
grid on