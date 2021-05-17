clc,clear,close all
% 数字低通技术指标
wp=0.2*pi;
ws=0.3*pi;
ap=1;
as=15;
T=0.01;

% 产生时域信号xt，要求给出xt的时域波形图
f1=5; f2=30;
t=0:0.001:1;
xt=sin(2*pi*f1*t)+0.5*cos(2*pi*f2*t);
subplot(221)
plot(t,xt)
xlabel('t');
ylabel('xt');
title('时域信号xt')
grid on

% xt的频谱分析 
N=64;
Fs=64;
Ts=1/Fs;
k=0:N-1;
xnT=sin(2*pi*f1*k*Ts)+0.5*cos(2*pi*f2*k*Ts);
Xk=fft(xnT,N);
wk=2*pi/N*k;% k对应的数字频率
subplot(222)
stem(wk/pi,abs(Xk)/max(abs(Xk)));   %为避免幅度值随变换区间N变化的缺点，画图时可归一化幅度谱。 
xlabel('w/\pi');
ylabel('xnT');
title('Xk')
grid on

% 利用双线性变换法的频率转换形式得到模拟滤波器的频率
Wp=(2/Ts)*tan(wp/2);
Ws=(2/Ts)*tan(ws/2);

% IIR 数字滤波器的设计及实现
[NN,Wc]=buttord(Wp,Ws,ap,as,'s');  %之前用过N，这里使用NN表示阶数  
[B,A]=butter(NN,Wc,'s');
[Bz,Az]=bilinear(B,A,Fs);
[H,w]=freqz(Bz,Az,NN);
subplot(223);
plot(w/pi,20*log10(abs(H)/max(abs(H))))
xlabel('w/\pi');
ylabel('dB');
title('损耗函数')
grid on

% 滤波后的时域波形图
subplot(224);
yt=filter(Bz,Az,xnT);
plot(k*Ts,yt)
title('滤波后信号的时域波形')
xlabel('t');
ylabel('yt');
grid on