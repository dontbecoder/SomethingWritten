%�����ˮӡ------Ƕ�����
clc;
clear;
close all;

turnkey=6;                             % ѡ��ԭʼͼ��
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
        I=imread('len2.bmp');
    case 7
        I=rgb2gray(imread('bao.png'));
    case 8
        I=imread('len1.bmp');        %Ƕ�뵽RGBͼ��
    case 9
        I=imread('len1.jpg');        %Ƕ�뵽RGBͼ��
    case 10
        I=imread('len.jpg');
end
        
Sy=imread('hd.bmp');           % ��Ƕ���ˮӡ��Ϣ
% Ii=I(:,:,1);
% Ij=I(:,:,2);
% Ik=I(:,:,3);
% [m,n]=size(Ii);

[M,N]=size(Sy);
% I1=double(Ii);
I1=double(I);
for i=1:M
    for j=1:N
        if mod(I1(2*i,2*j),2)==Sy(i,j)
            I1(2*i,2*j)=I1(2*i,2*j);
        else
            I1(2*i,2*j)=I1(2*i,2*j)-1;
        end
    end
end
%             JK=cat(3,I1,Ij,Ik);
% figure(1),imshow(I),title('Original');
% figure(2),imshow(Sy),title('Watermark');
figure(3),imshow(uint8(I1)),title('Watermarked');
% imwrite(uint8(I1),'Watermarked.jpg','q',100);
imwrite(uint8(I1),'Watermarked.bmp');
% figure(3),imshow(JK),title('Watermarked');
% imwrite(JK,'Watermarked.bmp');


