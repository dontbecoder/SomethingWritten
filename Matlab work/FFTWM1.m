%ˮӡ----Ƕ�����                        ����FFT  ��άFFT�任  4����ѡǶ��㣬Ƕ�ص�һ������Ƶ��
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
Deta=18;                       %
for i=1:u
    for j=1:v
        A=I(((i-1)*2+1):(i*2),((j-1)*2+1):(j*2));                                              % ��ȡͼ���
        B=fft2(A);
%         B1=fftshift(B);
        C=B;
        Lh1=floor(B(1)/Deta);
        
         if mod(Lh1,2)==Sy(i,j)
                         Lh2=Lh1*Deta+Deta/2;
         else 
                         if  rem(B(1),Deta) >= Deta/2
                             Lh2=(Lh1+1)*Deta+Deta/2;
                        else
                            Lh2=(Lh1-1)*Deta+Deta/2;
                        end
         end
          C(1)=Lh2;
%           C1=ifftshift(C);
          AA=ifft2(C);
          I1(((i-1)*2+1):(i*2),((j-1)*2+1):(j*2))=AA;
    end
end
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


%����    ����ȡ��
%floor   floor,ceil,fix,round,�Զ���ģ�����
%fix     floor,ceil,fix,round���ԣ��Զ���ķ���
%round   fix,floor  ��ǿ����
%ceil    floor,ceil,fix,round,�Զ���ģ�ȫ��