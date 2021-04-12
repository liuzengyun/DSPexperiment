function [Xejw]=dtft(xn,w)
% Discrete Time Fourier Transform
%xnΪ������������
%wΪ�۲��Ƶ������
N=length(xn);
X=0;
for ii=1:N
  X=xn(ii)*exp(-1i*w*(ii-1))+X;
end
Xejw=X;

