%���������Ӿ��İ���ˮӡ--ˮӡǶ��
clc;
clear;
close all;

turnkey=8;                             % ѡ��ԭʼͼ��
switch turnkey
    case 1
        I=imread('cameraman.tif');     % ԭʼͼ��cameraman
    case 2
        I=rgb2gray(imread('1.jpg'));  % ԭʼͼ��Lena
    case 3
        I=rgb2gray(imread('2.bmp'));     
    case 4
        I=rgb2gray(imread('3.jpg'));      
    case 5
        I=rgb2gray(imread('8.bmp'));      
    case 6
        I=imread('len1.tif');
    case 7
        I=rgb2gray(imread('bao.png'));
    case 8
        I=imread('len2.bmp');
end
        
Sy=imread('sy.bmp');           % ��Ƕ���ˮӡ��Ϣ

[m,n]=size(I);
I1=zeros(m,n);                 % ����ͼ���ֵ

pp=0.53;
fi=0.4;                        % ��Ҫ��������Ĳ��� 
pic=1;                         % ѡ��ͼ����С����bcrsy.m��һ������
switch pic
    case 1
        kx=256;
        ky=256;
    case 2
        kx=128;
        ky=128;
    case 3
        kx=64;
        ky=64;
    case 4
        kx=32;
        ky=32;
    case 5
        kx=16;
        ky=16;
    case 6
        kx=8;
        ky=8;
end

rx=kx/2;                       % rx*ry С��ϵ����ģ
ry=ky/2;
M=m/kx;                        % ���п���
N=n/ky;                        % ���п���
Numbers=M*N;                   % �ܿ���

% �������� 

 B=zeros(1,Numbers);            % ����ϵ��
 T=zeros(1,Numbers);            % ����ϵ��
 Sita=zeros(1,Numbers);         % ����ϵ��
 Deta=zeros(1,Numbers);         % ��������
 
cA1=zeros(rx,ry);              % LLϵ��
cH1=zeros(rx,ry);              % LHϵ��
cV1=zeros(rx,ry);              % HLϵ��
cD1=zeros(rx,ry);              % HHϵ��

Q=zeros(rx,ry);                % ����ֵ
S=zeros(rx,ry);                % �������cA1ϵ��

% �ֿ�
tmp=zeros(kx,ky);              % ԭʼͼ���ȡ�Ŀ�
tmp1=zeros(kx,ky);             % ����ϳɿ�
Tmp=zeros(rx,ry);              % ��ȡ��ˮӡ��
k=1;                           % ���ֵ��k=1������1����
for i=1:M
    for j=1:N
               
        tmp=I(((i-1)*kx+1):(i*kx),((j-1)*ky+1):(j*ky));                                              % ��ȡͼ���
        Tmp=Sy(((i-1)*rx+1):(i*rx),((j-1)*ry+1):(j*ry));                                             % ��ȡˮӡ��
        [cA1,cH1,cV1,cD1]=dwt2(tmp,'haar');                                                          % haarС���任

        B(1,k)=sum(sum(cA1));                                                                   % ����ϵ��
        T(1,k)=sum(sum(abs(cH1)))+sum(sum(abs(cV1)))+sum(sum(abs(cD1)));                     % ����ϵ��
        Sita(1,k)=(std(reshape(cH1,rx*ry,1))+std(reshape(cV1,rx*ry,1))+std(reshape(cD1,rx*ry,1)))/3; % ����ϵ��
        Deta(1,k)=round(log2(B(1,k)+T(1,k)+Sita(1,k))*fi); 
        
      Q=floor(cA1/Deta(1,k));                                                                      % ����LLϵ��
        
         for p=1:rx                                                                                 % ����cA1��ϵ��ֵΪS
            for q=1:ry
               if mod(Q(p,q),2)==Tmp(p,q)
                      if cA1(p,q)>0
                         S(p,q)=Q(p,q)*Deta(1,k)+Deta(1,k)*pp;
                     else
                          S(p,q)=Q(p,q)*Deta(1,k)-Deta(1,k)*pp;
                      end
                  else
                      if cA1(p,q)>0 
                         if rem(cA1(p,q),Deta(1,k)) >= Deta(k)*pp
                             S(p,q)=(Q(p,q)+1)*Deta(1,k)+Deta(1,k)*pp;
                         else
                             S(p,q)=(Q(p,q)-1)*Deta(1,k)+Deta(1,k)*pp;
                         end
                     else
                          if abs(rem(cA1(p,q),Deta(1,k))) >= Deta(k)*pp
                              S(p,q)=(Q(p,q)-1)*Deta(1,k)-Deta(1,k)*pp;
                          else
                              S(p,q)=Q(p,q)*Deta(1,k)+Deta(1,k)*pp;
                          end
                      end
                  end
              end
          end
         tmp1=IDWT2(S,cH1,cV1,cD1,'haar');                                                            % С����任     
         I1(((i-1)*kx+1):(i*kx),((j-1)*ky+1):(j*ky))=tmp1;                                            % ��ӵ�����ͼ����ȥ
        k=k+1;                                                                                       % ������һ��ͼ���
   end
   end

    for p1=1:m/2
       for q1=1:n/2
           tmp2=I1(1+(2*(p1-1)):2*p1,1+(2*(q1-1)):2*q1);       % ��ȡͼ��2*2��
           I2(1+(2*(p1-1)):2*p1,1+(2*(q1-1)):2*q1)=tiaozheng(tmp2); %����ϵ��     
           q1=q1+1;
       end
       p1=p1+1;
   end

%figure(1),imshow(I),title('Original');
%figure(2),imshow(Sy),title('Watermark');
%figure(3),imshow(uint8(I2)),title('Watermarked');
imwrite(uint8(I2),'Watermarked.bmp');

%figure(3),imshow(uint8(round(I1))),title('Watermarked');
%imwrite(uint8(round(I1)),'Watermarked.bmp');

B
T
Sita
Deta

