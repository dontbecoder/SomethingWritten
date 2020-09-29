%С�����ˮӡ------Ƕ�����          �������ģ�����ȡ����floor������ȡ��ʱ�������ⷽ��
clc;
clear;
close all;

turnkey=1;                             % ѡ��ԭʼͼ��
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
        I=imread('len1.bmp');        %Ƕ�뵽RGBͼ��
    case 9
        I=imread('len1.jpg');        %Ƕ�뵽RGBͼ��
end
        
Sy=imread('hd.bmp');           % ��Ƕ���ˮӡ��Ϣ
% Ii=I(:,:,1);
% Ij=I(:,:,2);
% Ik=I(:,:,3);
% [m,n]=size(Ik);
[m,n]=size(I);
[A H V D]=dwt2(I,'haar');
Deta=2;
B=floor(A/Deta);
[M,N]=size(Sy);
S=zeros(M,N);
for i=1:M
    for j=1:N
        if mod(B(i,j),2)==Sy(i,j)
            S(i,j)=(B(i,j)*Deta)+Deta/2;
        else
            if rem(B(i,j),2) >=Deta/2
            S(i,j)=(B(i,j)+1)*Deta+Deta/2;
            else
             S(i,j)=(B(i,j)-1)*Deta+Deta/2;
            end
        end
    end
end
%            Ik1=idwt2(S,H,V,D,'haar');
%            Ik1=round(Ik1);
%            JK=cat(3,Ii,Ij,Ik1);
I1=idwt2(S,H,V,D,'haar');
I2=zeros(256);
zhengshu=floor(I1);
xiaoshu=I1-zhengshu;
u=m/2;
v=n/2;
for i=1:u
    for j=1:v
        Xblock=xiaoshu(((i-1)*2+1):(i*2),((j-1)*2+1):(j*2));
        Zblock=zhengshu(((i-1)*2+1):(i*2),((j-1)*2+1):(j*2));
        s=sum(sum(Xblock));
        while (s>0.5)
         z=max(max(Xblock));
         [x y]=find(Xblock==z);
        Zblock(x(end),y(end))=Zblock(x(end),y(end))+1;
        s=s-1;
        end
        I2(((i-1)*2+1):(i*2),((j-1)*2+1):(j*2))=Zblock;
    end
end
% figure(1),imshow(I),title('Original');
% figure(2),imshow(Sy),title('Watermark');
figure(3),imshow(uint8(I2)),title('Watermarked');        %�Ҷ�ͼ��
imwrite(uint8(I2),'Watermarked.bmp');                    %�Ҷ�ͼ��
% figure(3),imshow(JK),title('Watermarked');                     RGBͼ�� 
% imwrite(JK,'Watermarked.bmp');                                 RGBͼ��
 

