 % ֱ�Ӱ�ˮӡ������LSB  
clc;       
clear;
close all;
turnkey=10;                             % ѡ��ԭʼͼ��
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
        I=imread('bao.png');
    case 8
        I=imread('len1.bmp');        %RGBͼ��
    case 9
        I=imread('len1.jpg');        %RGBͼ��
    case 10
        I=imread('len2.bmp');
end
I1=I;
Sy=imread('hd.bmp');  
Sy1=uint8(Sy);
[m n]=size(I1);
[u v]=size(Sy);
k=m/u;
for i=1:u
    for j=1:v
        A=I1(((i-1)*k+1),((j-1)*k+1));
        B=bitand(A,254);                %���λ����
        A=bitor(B,Sy1(i,j));            %Ƕ��
        I1(((i-1)*k+1),((j-1)*k+1))=A;
    end
end
 imshow(I1),title('ԭʼͼ��');
 figure,imshow(Sy),title('ˮӡ��Ϣ');
 imwrite(I1,'Watermarked.bmp');
 figure,imshow(I1),title('Ƕ����ͼ��');
 