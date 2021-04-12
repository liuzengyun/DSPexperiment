function [Xejw]=dtft(xn,w)
% Discrete Time Fourier Transform
%xn为待分析的序列
%w为观察的频域向量
N=length(xn);
X=0;
for ii=1:N
  X=xn(ii)*exp(-1i*w*(ii-1))+X;
end
Xejw=X;

