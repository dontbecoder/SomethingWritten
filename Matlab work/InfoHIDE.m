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
        I=imread('bao.png');
    case 8
        I=imread('len1.bmp');        %RGBͼ��
    case 9
        I=imread('len1.jpg');        %RGBͼ��
    case 10
        I=imread('len.jpg');
end
key=1;
switch key
     case 1
     Info=imread('cameraman.tif');
     case 2
    Info=imread('len2.bmp');
%      case 3                         %��ֵͼ��
    Info=double(imread('hd3.bmp')); 
end
Ii=I(:,:,1);       %R
Ij=I(:,:,2);       %G
Ik=I(:,:,3);       %B
Ij1=bitand(Ij,240);       %��4λ����
Ik1=bitand(Ik,240);       %��4λ����

InfoA=bitand(Info,15);     %�Ѹ�4λ���Σ����ص�4λ
Y=bitor(Ij1,InfoA);

InfoB=bitand(Info,240);    %�ѵ�4λ���Σ����ظ�4λ
InfoB1=bitshift(InfoB,-4);
Z=bitor(Ik1,InfoB1);

 JK=cat(3,Ii,Y,Z);
 imshow(I),title('����ͼ��');
 figure,imshow(Info),title('������Ϣ');
 figure,imshow(JK),title('���غ�ͼ��');
 imwrite(JK,'secret.png');