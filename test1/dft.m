function [Xk]=dft(xn, N)
%Discrete Fourier Transform
%xn为待分析的序列，
%N为DFT点数
%程序要求xn的长度与N不等时，需补零延长至N
l=length(xn);
if l<N
    xn=[xn,zeros(1,N-l)];
end
Xk=zeros(1,N);
k=zeros(1,N);
for i=1:N
    k(i)=i-1;
end

for i=1:N
    Xk=Xk+xn(i)*exp(-1i*2*pi/N*(i-1)*k);
end
