%ˮӡ----Ƕ�����                        ����һάFFT   ���Ǿ��ȡ�ȡ��sample����  ��16���������ʱ��
%��������ǲ��䣬��ʵ����
% Ƕ����ԣ����ݸ��ϻ��磬Ƕ��һ�����һ��
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
Sy=imread('hd2.bmp');           % ��Ƕ���ˮӡ��Ϣ
[u v]=size(Sy);            
shuiyin=reshape(Sy,1,u*v);
Deta=20;                       %����   kk=5,kk2=13,d=10������ã�kk=4,kk2=14,d=8������ã�kk=6,kk2=12,d=10�������; kk=1,d=17���϶���
Deta1=25;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a=zeros(1,4096);
b=[1 1 0 0 1 1 0 0];%��ʼֵ
for p=1:4096
    a(p)=b(1);
    for q=1:7
        b(q)=b(q+1);
        tp=xor(b(8),b(4));
        tp1=xor(tp,b(3));
        b(8)=xor(tp1,b(2));
    end
end
K=10;
x=zeros(1,4096);
x(1)=0.1234567;
c=zeros(1,4096);
for k=1:4096
    if a(k)==0      %����0��1ѡ����   
     x(k+1)=sqrt(abs(2*x(k)-1));
    else
        x(k+1)=1-sqrt(abs(2*x(k)-1));
    end
    c(k)=mod(fix(x(k)*2^K), 2);%ת������,�õ��ܳ�
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:u*v
        
        A=Zaiti(((i-1)*16+1):i*16);                                             % ��ȡͼ���
        B=fft(A);                                                               % һά����Ҷ�任
        xiangjiao=angle(B);                                                     % �����
        C=B;
        B1=abs(B);                                                              % ��ģ
        if c(i)==0
            kk=1;      %Ƕ��ĵ�һ��
%             kk2=10;    %��һ��ĶԳ��޸ĵ�
%             mm=14;     %��һ��ĸ���Ƕ���
%             mm2=4;     %����Ƕ���ĶԳƵ�
              Lh1=ceil(B1(kk)/Deta1);
              if abs(B1(kk))~=0
                    if mod(Lh1,2)==shuiyin(i)
                         Lh2=Lh1*Deta1+Deta1/2;
                     else 
                            if  rem(B1(kk),Deta1) >= Deta1/2
                             Lh2=(Lh1+1)*Deta1+Deta1/2;
                           else
                            Lh2=(Lh1-1)*Deta1+Deta1/2;
                           end
                    end
%               r=sqrt(Lh2^2/sec(xiangjiao(kk))^2);                      %ʵ��
%               xu=sqrt(Lh2^2-Lh2^2/sec(xiangjiao(kk))^2);           %�鲿
%               C(kk)=r*sign(real(B(kk)))+xu*sign(imag(B(kk)))*j;
                C(kk)=Lh2;
            else 
                    if mod(Lh1,2)==shuiyin(i)
                       C(kk)=B(kk);
                   else
                             C(kk)=(Lh1+1)*Deta1+Deta1/2;
                    end
            end
        else
            kk=7;     %Ƕ��ĵ�һ��
            kk2=11;   %��һ��ĶԳ��޸ĵ�
            mm=15;    %��һ��ĸ���Ƕ���
            mm2=3;    %����Ƕ���ĶԳƵ�
       
        Lh1=ceil(B1(kk)/Deta);
        Lh1a=ceil(B1(mm)/Deta);
        
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
              C(kk2)=r*sign(real(B(kk2)))+xu*sign(imag(B(kk2)))*j;
            else 
                    if mod(Lh1,2)==shuiyin(i)
                       C(kk)=B(kk);
                    else
                             C(kk)=(Lh1+1)*Deta+Deta/2;
                             C(kk2)=(Lh1+1)*Deta+Deta/2;
                    end
            end
        
            if abs(B1(mm))~=0                                            %Ƕ��ĵڶ����㣨�����㣩
                   if mod(Lh1a,2)==shuiyin(i)
                         Lh2a=Lh1a*Deta+Deta/2;
                   else 
                         if  rem(B1(mm),Deta) >= Deta/2
                             Lh2a=(Lh1a+1)*Deta+Deta/2;
                         else
                            Lh2a=(Lh1a-1)*Deta+Deta/2;
                        end
                   end
              ra=sqrt(Lh2a^2/sec(xiangjiao(mm))^2);                      %ʵ��
              xua=sqrt(Lh2a^2-Lh2a^2/sec(xiangjiao(mm))^2);               %�鲿
              C(mm)=ra*sign(real(B(mm)))+xua*sign(imag(B(mm)))*j;
              C(mm2)=ra*sign(real(B(mm2)))+xua*sign(imag(B(mm2)))*j;
        else 
                 if mod(Lh1a,2)==shuiyin(i)
                       C(mm)=B(mm);
                 else
                             C(mm)=(Lh1a+1)*Deta+Deta/2;
                             C(mm2)=(Lh1a+1)*Deta+Deta/2;
                 end
        end
    end
            AA=ifft(C);
            Zaiti2(((i-1)*16+1):i*16)=AA;

 end
I1=reshape(Zaiti2,m,n);

TI=uint8(round(I1));
% TI=uint8(I1);
% figure(1),imshow(I),title('Original');
figure(2),imshow(Sy),title('Watermark');
% figure(3),imshow(uint8(round(I1))),title('Watermarked');
imwrite(TI,'Watermarked.bmp');
figure(3),imshow(TI),title('Watermarked');
%imwrite(TI,'Watermarked.bmp');
