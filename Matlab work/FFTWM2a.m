%ˮӡ----Ƕ�����                        ����һάFFT   �Ǿ���ȡ��sample����8�������㣩   ������ʵ�����䣬���鲿
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
Zaiti=reshape(I,1,m*n);
I1=zeros(m,n);                 % ����ͼ���ֵ     
Sy=imread('hd2.bmp');           % ��Ƕ���ˮӡ��Ϣ
[u v]=size(Sy);            
shuiyin=reshape(Sy,1,u*v);
Zt=Zaiti(1:m*n-u*v*8);
Syu=Zaiti(m*n-u*v*8+1:m*n);
Deta=4;                       %����   kk=3,kk2=7,ȡ��4��ʱ�������;
kk=3;
kk2=7;
for i=1:u*v
        
        A=Zt(((i-1)*8+1):i*8);                                             % ��ȡͼ���
        B=fft(A);
%         B1=fftshift(B);
        C=B;
        B1=abs(B);
        Lh1=floor(B1(kk)/Deta);
         if mod(Lh1,2)==shuiyin(i)
                         Lh2=Lh1*Deta+Deta/2;
         else 
                         if  rem(B1(kk),Deta) >= Deta/2
                             Lh2=(Lh1+1)*Deta+Deta/2;
                        else
                            Lh2=(Lh1-1)*Deta+Deta/2;
                        end
         end
          ii=sqrt(abs(Lh2^2-real(B(kk))^2));               %�鲿
%           C1=ifftshift(C);
          C(kk)=ii*j+real(B(kk));
          C(kk2)=ii*j+real(B(kk2));
          AA=ifft(C);
          Zaiti2(((i-1)*8+1):i*8)=AA;
    
end
Hebinghou=zeros(1,m*n);
Hebinghou(1:m*n-u*v*8)=Zaiti2;
Hebinghou(m*n-u*v*8+1:m*n)=Syu;
I1=reshape(Hebinghou,m,n);
% zhengshu=floor(I1);
% xiaoshu=I1-zhengshu;
% for i=1:u
%     for j=1:v
%         Xblock=xiaoshu(((i-1)*2+1):(i*2),((j-1)*2+1):(j*2));
%         Zblock=zhengshu(((i-1)*2+1):(i*2),((j-1)*2+1):(j*2));
%         s=sum(sum(Xblock));
%         while (s>0.5)
%          z=max(max(Xblock));
%          [x y]=find(Xblock==z);
%         Zblock(x(end),y(end))=Zblock(x(end),y(end))+1;
%         s=s-1;
%         end
%         I2(((i-1)*2+1):(i*2),((j-1)*2+1):(j*2))=Zblock;
%     end
% end
% TI=uint8(I2);
TI=uint8(round(I1));
% figure(1),imshow(I),title('Original');
figure(2),imshow(Sy),title('Watermark');
% figure(3),imshow(uint8(round(I1))),title('Watermarked');
imwrite(TI,'Watermarked.bmp');
figure(3),imshow(TI),title('Watermarked');
% imwrite(TI,'Watermarked.bmp');
% imwrite(I1,'watermarked.bmp')


