%ˮӡ----Ƕ�����                        ����svd�ֽ�
clc;
clear;
close all;
turnkey=8;                             % ѡ��ԭʼͼ��
switch turnkey
    case 1
        I=imread('cameraman.tif');     % ԭʼͼ��cameraman
    case 2
        I=rgb2gray(imread('50.bmp'));  % ԭʼͼ��Lena
    case 3
        I=rgb2gray(imread('face.png'));     
    case 4
        I=rgb2gray(imread('len1.jpg'));      
    case 5
         I=rgb2gray(imread('tu1.jpg'));    
     case 6
         I=rgb2gray(imread('bao.png'));
     case 7
         I=imread('len1.tif');
     case 8
         I=imread('len2.bmp');
end
[m,n]=size(I);
I1=zeros(m,n);                 % ����ͼ���ֵ     
Sy=imread('hd.bmp');           % ��Ƕ���ˮӡ��Ϣ
[u v]=size(Sy);            
Deta=6;                       %
for i=1:u
    for j=1:v
        A=I(((i-1)*2+1):(i*2),((j-1)*2+1):(j*2));                                              % ��ȡͼ���
        [U,S,V]=svd(double(A));
        s=max(max(S));
        [x y]=find(S==s);
        S(x(1),y(1))=floor(S(x(1),y(1))/Deta);
        if mod(S(x(1),y(1)),2)==Sy(i,j)
           S(x(1),y(1))=S(x(1),y(1))*Deta+Deta/2;
        else 
           S(x(1),y(1))=(S(x(1),y(1))-1)*Deta+Deta/2;
        end
        I1(((i-1)*2+1):(i*2),((j-1)*2+1):(j*2))=U*S*V';
        I2=abs(I1);
    end
end
TI=uint8(I2);
% TI=round(I1);
% figure(1),imshow(I),title('Original');
figure(2),imshow(Sy),title('Watermark');
% figure(3),imshow(uint8(round(I1))),title('Watermarked');
imwrite(uint8(round(I2)),'Watermarked.bmp');
figure(3),imshow(TI),title('Watermarked');
% imwrite(TI,'Watermarked.bmp');
% imwrite(I1,'watermarked.bmp')