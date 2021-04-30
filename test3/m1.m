clc,clear,close all
xn=[1/2,1,1,1/2];
Xk=fft(xn,7);
Yk=Xk.*Xk;
yn=ifft(Yk);
subplot(211)
stem(yn)
xlabel('n');
ylabel('xn*xn');
title('利用fft计算线性卷积');
ynn=conv(xn,xn);
subplot(212)
stem(ynn);
xlabel('n');
ylabel('xn*xn');
title('利用conv函数计算线性卷积');
