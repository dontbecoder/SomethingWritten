clc;
clear;
close all;

turnkey=1;                             % 选择原始图像
switch turnkey
    case 1
        II=imread('len2.bmp');
        I=II(65:128,65:128);
    case 2
        I=imread('len2.bmp');
    case 3
        I=imread('gongjihou.bmp');
    case 4
        I=imread('xx.bmp');
    case 5
         II=imread('len2.bmp');
        I=II(65:128,65:128);
end
[m n]=size(I);
L=2;              %小波变换尺度
% s=zeros(1,2^L);
c0=0;
c025=0;
c05=0;
c075=0;
IM=reshape(I,1,m*n); % 排成串

for i=1:m*n/(2^L)^2       %分段
    A=IM((i-1)*(2^L)^2+1:i*(2^L)^2);
       for j=1:(2^L)^2    
           s(j)=mod(double(A(j)),4);
           z=mod(sum(s),4);
       end
        if z==0
            c0=c0+1;
        elseif z==1
            c025=c025+1;
        elseif z==2
            c05=c05+1;
        elseif z==3
            c075=c075+1;
        end
end
C0=c0+c05
C1=c025+c075
       