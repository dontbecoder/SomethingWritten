%С�����ˮӡ------Ƕ�����          �������ģ�����ȡ����floor��
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
        I=imread('len2.bmp');
    case 8
        I=imread('len1.bmp');        %Ƕ�뵽RGBͼ��
    case 9
        I=imread('len1.jpg');        %Ƕ�뵽RGBͼ��
end
        
Sy=imread('hd.bmp');           % ��Ƕ���ˮӡ��Ϣ
% Ii=I(:,:,1);
% Ij=I(:,:,2);
% Ik=I(:,:,3);
% [m,n]=size(Ik)8
[m,n]=size(I);
[A H V D]=dwt2(I,'haar');
Deta=8;
B=floor(A/Deta);
[M,N]=size(Sy);
S=zeros(M,N);
for i=1:M
    for j=1:N
        if mod(B(i,j),2)==Sy(i,j)
            S(i,j)=(B(i,j)*Deta)+Deta/2;
%              S(i,j)=B(i,j)*Deta;
        else
            if rem(B(i,j),2) >=Deta/2
            S(i,j)=(B(i,j)+1)*Deta+Deta/2;
%             S(i,j)=(B(i,j)+1)*Deta;
            else
             S(i,j)=(B(i,j)-1)*Deta+Deta/2;
%               S(i,j)=(B(i,j)-1)*Deta;
            end
        end
    end
end
%            Ik1=idwt2(S,H,V,D,'haar');
%            Ik1=round(Ik1);
%            JK=cat(3,Ii,Ij,Ik1);
I1=idwt2(S,H,V,D,'haar');
figure(1),imshow(I),title('Original');
figure(2),imshow(Sy),title('Watermark');
figure(3),imshow(uint8(round(I1))),title('Watermarked');        %�Ҷ�ͼ��
imwrite(uint8(round(I1)),'Watermarked.bmp');                    %�Ҷ�ͼ��
% figure(3),imshow(JK),title('Watermarked');                     RGBͼ�� 
% imwrite(JK,'Watermarked.bmp');                                 RGBͼ��
 

