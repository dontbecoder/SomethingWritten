% ���ס��ɻָ�������ͼ��ˮӡ������---ֱ�Ӱ�ˮӡ������LSB  
clc;       
clear;
close all;
turnkey=7;                             % ѡ��ԭʼͼ��
switch turnkey
    case 1
        I=imread('cameraman.tif');     % ԭʼͼ��cameraman
    case 2
        I=rgb2gray(imread('50.bmp'));  % ԭʼͼ��Lena
    case 3
        I=rgb2gray(imread('tu1.jpg'));     
    case 4
        I=rgb2gray(imread('win.jpg'));      
    case 5
        I=rgb2gray(imread('8.bmp'));      
    case 6
        I=imread('len1.tif');
    case 7
        I=imread('sample.bmp');
    case 8
        I=imread('len1.bmp');        %RGBͼ��
    case 9
        I=imread('len1.jpg');        %RGBͼ��
    case 10
        I=imread('len2.bmp');
end
[m n]=size(I);
I1=bitand(I,128);   %��ȡMSB
a1=I(1:128,1:128);   %MSBͼ���4��
a2=I(1:128,129:256);
a3=I(129:256,1:128);
a4=I(129:256,129:256);
y1=ArnoldF(a1,32);    %arnold����
y2=ArnoldF(a2,17);
y3=ArnoldF(a3,19);
y4=ArnoldF(a4,25);
I2=[y1 y2;y3 y4];
I3=reshape(I2,1,m*n);   %�������г�һ��

x1=I(1:128,1:128);   %ԭʼͼ���4��
x2=I(1:128,129:256);
x3=I(129:256,1:128);
x4=I(129:256,129:256);


Z1=cell(1,m*n*4);
Ham0=zeros(1,m*n/4);
Ham1=zeros(1,m*n/4);
Ham2=zeros(1,m*n/4);

for k=1:m*n/4
    Z=I3((k-1)*4+1:k*4);
        for i=1:4
        Z1{i}=dec2bin(double(Z(i)));       %ת������
               if str2num(Z1{i})~=0
                  Z1{i}=char('1');
               end
        end
        r0=xor(Z1{1},Z1{2});
        r0=xor(r0,Z1{3});
        r1=xor(Z1{1},Z1{2});
        r1=xor(r1,Z1{4});
        r2=xor(Z1{1},Z1{3});
        r2=xor(r2,Z1{4});
        Ham0(k)=r0;
        Ham1(k)=r1;
        Ham2(k)=r2;
 end
 HM0=uint8(reshape(Ham0,128,128));
  HM1=uint8(reshape(Ham1,128,128));
   HM2=uint8(reshape(Ham2,128,128));
   
   X1=bitand(x1,254);    %���λ����
    X2=bitand(x2,254);    %���λ����
     X3=bitand(x3,254);    %���λ����
     
     Y1=bitor(X1,HM0);   %Ƕ��ˮӡ
     Y2=bitor(X2,HM1);   %Ƕ��ˮӡ
     Y3=bitor(X3,HM2);   %Ƕ��ˮӡ
     
     I4=[Y1 Y2;Y3 x4];
     TI=uint8(I4);
     imshow(TI)
     imwrite(TI,'qianruhou.bmp')