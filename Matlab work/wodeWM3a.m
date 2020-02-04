%���������Ӿ��İ���ˮӡ--ˮӡǶ��(����DCTϵ��,wodeWM3�ĸĽ��棬����ȡ������round��Ч������wodeWM3b��ȡ��ʱ���Զ���ķ�����
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
Numbers=m*n/64;                   % �ܿ���
M=m/8;
N=n/8;
Sy=imread('hd.bmp');           % ��Ƕ���ˮӡ��Ϣ
[u v]=size(Sy);            
SNumbers=u*v/Numbers;           % ˮӡ���С
BC=sqrt(SNumbers);               % ˮӡ��߳�
tmp=zeros(8,8);              % ͼ���ȡ�Ŀ�
tmp1=zeros(1,64);             % ͼ���ȡ�Ŀ�2
tmp1a=zeros(1,64);
Tmp=zeros(BC,BC);            % ��ȡ��ˮӡ��
% LH=[16 11 10 16 24 40 51 61;
%     12 12 14 19 26 58 60 55;
%     14 13 16 24 40 57 69 56;
%     14 17 22 29 51 87 80 62;
%     18 22 37 56 68 109 103 77;
%     24 35 55 64 81 104 113 92;
%     49 64 78 87 103 121 120 101;             
%     72 92 95 98 112 100 103 99];                         
Deta=2.5;
maxB=16320;
maxT=5361;

for i=1:M
    for j=1:N
       
        A=I(((i-1)*8+1):(i*8),((j-1)*8+1):(j*8));                                              % ��ȡͼ���
        tmp=dct2(A);
%         B=tmp(1,1)/maxB;
%         T=sum(sum(abs(tmp)))/maxT;
%         S=std(reshape(tmp,1,64));
%         Deta=log(S*(T+B));
        Tmp=Sy(((i-1)*BC+1):(i*BC),((j-1)*BC+1):(j*BC));                                         % ��ȡˮӡ��
        Tmp1=reshape(Tmp,1,BC*BC);                  % ��ȡˮӡ��
%         tmp1ab=round(tmp./LH);                          %����
        tmp1a=gzigzag1(tmp);                            % ��ȡͼ���
%         Deta=sum(tmp1a(1:4))/4;
        tmp1a(4:19)=round(tmp1a(4:19)/Deta);              %����
%          for  a=1:BC*BC
%              if mod(tmp1a(a),2)==Tmp1(a)
%                  tmp1a(a)=(tmp1a(a)*Deta)+0.001;
%              else 
%                  tmp1a(a)=((tmp1a(a)-1)*Deta)+0.001;
%              end
%          end
          for  a=1:BC*BC                                        % ��Ƶ
             if mod(tmp1a(a+3),2)==Tmp1(a)
                 tmp1a(a+3)=(tmp1a(a+3)*Deta);
             else 
                 tmp1a(a+3)=((tmp1a(a+3)-1)*Deta);
             end
         end
          tmp=gzigzagINVERSE(tmp1a);
          I1(((i-1)*8+1):(i*8),((j-1)*8+1):(j*8))=idct2(tmp);
     end
 end
zhengshu=floor(I1);
xiaoshu=I1-zhengshu;
u1=m/2;
v1=n/2;
for i=1:u1
    for j=1:v1
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
% TI=round(I1);
% figure(1),imshow(I),title('Original');
figure(2),imshow(Sy),title('Watermark');
% figure(3),imshow(uint8(round(I1))),title('Watermarked');
imwrite(uint8(I2),'Watermarked.bmp');
figure(3),imshow(uint8(I2)),title('Watermarked');
% imwrite(TI,'Watermarked.bmp');
% imwrite(I1,'watermarked.bmp')