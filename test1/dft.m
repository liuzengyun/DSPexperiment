function [Xk]=dft(xn, N)
%Discrete Fourier Transform
%xnΪ�����������У�
%NΪDFT����
%����Ҫ��xn�ĳ�����N����ʱ���貹���ӳ���N
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
