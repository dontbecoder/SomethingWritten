%���������Ӿ��İ���ˮӡ--ˮӡǶ��(DCT)
clc;
clear;
close all;
                


 I=imread('cameraman.tif');     % ԭʼͼ��cameraman
m=256;
n=256;
I1=zeros(256,256);                 % ����ͼ���ֵ     
% Numbers=1024;                   % �ܿ���
% M=32;
% N=32;
Sy=imread('hd2.bmp');           % ��Ƕ���ˮӡ��Ϣ
u=32;
v=32;
SNumbers=1;         % ˮӡ���С
BC=1;               % ˮӡ��߳�
% tmp=zeros(8,8);              % ͼ���ȡ�Ŀ�
% tmp1=zeros(1,64);             % ͼ���ȡ�Ŀ�2
Tmp=zeros(1,1);            % ��ȡ��ˮӡ��
% Linshi=zeros(1,8);        
LH=[16 11 10 16 24 40 51 61;
    12 12 14 19 26 58 60 55;
    14 13 16 24 40 57 69 56;
    14 17 22 29 51 87 80 62;
    18 22 37 56 68 109 103 77;
    24 35 55 64 81 104 113 92;
    49 64 78 87 103 121 120 101;
    72 92 95 98 112 100 103 99];
for i=1:32
    for j=1:32
       
        A=I(((i-1)*8+1):(i*8),((j-1)*8+1):(j*8));                                              % ��ȡͼ���
        tmp=dct2(A);
%         tmp1a=round(tmp/2);
%         Tmp=Sy(((i-1)*1+1):(i*1),((j-1)*1+1):(j*1));                                         % ��ȡˮӡ��
%         Tmp1=reshape(Tmp,1,16);                  % ��ȡˮӡ��
%         tmp1a=gzigzag1(tmp);                         % ��ȡͼ���
%          Linshi(1:8)=round(tmp1a(4:11)/2);
%         tp=abs(sum(Linshi(:)));
         tmp1=round(tmp./LH);
             if mod(tmp1(1,1),2)==Tmp
                 tmp1(1,1)=tmp1(1,1);
             else 
                 tmp1(1,1)=tmp1(1,1)+1;
             end
%          TP=gzigzagINVERSE(tmp1a);
%          tmp1a=round(TP.*LH);
%           tmp=gzigzagINVERSE(tmp1a);
           tmp2=tmp1.*LH;
          I1(((i-1)*8+1):(i*8),((j-1)*8+1):(j*8))=idct2(tmp2);
     end
 end
% TI=uint8(I1);
figure(1),imshow(I),title('Original');
figure(2),imshow(Sy),title('Watermark');
% figure(3),imshow(uint8(round(I1))),title('Watermarked');
% imwrite(uint8(round(I1)),'Watermarked.bmp');
figure(3),imshow(uint8(round(I1))),title('Watermarked');
imwrite(uint8(round(I1)),'Watermarked.bmp');

