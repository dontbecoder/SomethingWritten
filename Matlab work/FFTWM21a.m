%ˮӡ----Ƕ�����                        ����һάFFT   �Ǿ���ȡ��sample���� ����8�������㣩  ��������ǲ���
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
Zt=Zaiti(1:m*n-u*v*8);           %���岿��
Syu=Zaiti(m*n-u*v*8+1:m*n);      %ʣ�ಿ��
Deta=30;                       %����   kk=3,kk2=7,ȡ��4��ʱ�������;
kk=1;
kk2=7;                        %��ɶ��޸�
for i=1:u*v
        
        A=Zt(((i-1)*8+1):i*8);                                             % ��ȡͼ���
        B=fft(A);
        xiangjiao=angle(B);
        C=B;
        B1=abs(B);
        Lh1=ceil(B1(kk)/Deta);
    if abs(B1(kk))~=0
         if mod(Lh1,2)==shuiyin(i)
                         Lh2=Lh1*Deta+Deta/2;
         else 
                         if  rem(B1(kk),Deta) >= Deta/2
                             Lh2=(Lh1+1)*Deta+Deta/2;
                        else
                            Lh2=(Lh1-1)*Deta+Deta/2;
                        end
         end
         r=sqrt(Lh2^2/sec(xiangjiao(kk))^2);                      %ʵ��
         xu=sqrt(Lh2^2-Lh2^2/sec(xiangjiao(kk))^2);           %�鲿
           C(kk)=r*sign(real(B(kk)))+xu*sign(imag(B(kk)))*j;
%            C(kk2)=r*sign(real(B(kk2)))+xu*sign(imag(B(kk2)))*j;
    else
        if mod(Lh1,2)==shuiyin(i)
                       C(kk)=B(kk);
                 else

                             C(kk)=(Lh1+1)*Deta+Deta/2;
%                              C(kk2)=(Lh1+1)*Deta+Deta/2;
                              
                 end
     end
         AA=ifft(C);
         Zaiti2(((i-1)*8+1):i*8)=AA;
end

% zhengshu=floor(Zaiti2);
% xiaoshu=Zaiti2-zhengshu;
% for i=1:4096
%         Xblock=xiaoshu(((i-1)*8+1):(i*8));
%         Zblock=zhengshu(((i-1)*8+1):(i*8));
%         x1=Xblock(1:4:16);    % xiao shu
%         x2=Xblock(2:4:16);
%         x3=Xblock(3:4:16);
%         x4=Xblock(4:4:16);
%         z1=Zblock(1:4:16);   % ��������
%         z2=Zblock(2:4:16);
%         z3=Zblock(3:4:16);
%         z4=Zblock(4:4:16);
%         ss1=sum(sum(x1));    % С����
%         ss2=sum(sum(x2));
%         ss3=sum(sum(x3));
%         ss4=sum(sum(x4));
%         z=[z1 z2 z3 z4];        %�ų�һ��
%         ss=[ss1 ss2 ss3 ss4];   %��Ҳ�ų�һ��
%        for  yy=1:4
%           while   ss(yy)>5
%                  z(yy)=z(yy)+1;
%                  ss(yy)=ss(yy)-1;
%           end
%        end
%         I2(((i-1)*8+1):(i*8))=Zblock;
% end
Hebinghou=zeros(1,m*n);
Hebinghou(1:m*n-u*v*8)=Zaiti2;       %��ˮӡ����
Hebinghou(m*n-u*v*8+1:m*n)=Syu;      %ʣ�ಿ��
I3=reshape(Hebinghou,m,n);           %�ϲ����ͼ��
TI=uint8(I3);
% TI=uint8(round(I1));
% figure(1),imshow(I),title('Original');
figure(2),imshow(Sy),title('Watermark');
% figure(3),imshow(uint8(round(I1))),title('Watermarked');
imwrite(TI,'Watermarked.bmp');
figure(3),imshow(TI),title('Watermarked');
% imwrite(TI,'Watermarked.bmp');
% imwrite(I1,'watermarked.bmp')


