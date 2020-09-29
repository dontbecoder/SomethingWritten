%���������Ӿ��İ���ˮӡ--ˮӡǶ��  (��ҵ���ĳ���)
clc;
clear;
close all;

turnkey=2;    % ѡ��ԭʼͼ��
switch turnkey
    case 1
        I=imread('cameraman.tif');   % ԭʼͼ��cameraman      
    case 2
        I=imread('len2.bmp');   % ԭʼͼ��len
    case 3
        I=rgb2gray(imread('F:\ѧϰ\����ͼ����\ͼ��\12-����ͼ���\12-����ͼ���\����ͼ���1\41.bmp'));   % ԭʼͼ��
    case 4
        I=imread('50.bmp');   % ԭʼͼ��
    case 5
        I=rgb2gray(imread('ye.jpg'));   % ԭʼͼ��
    case 6
        I=rgb2gray(imread('F:\ѧϰ\����ͼ����\ͼ��\12-����ͼ���\12-����ͼ���\����ͼ���2\41.bmp'));   % ԭʼͼ��
end

%       II=rgb2gray(III); %�����ת���ɻҶ�ͼ��  
%       I=II(1:256,1:256);    % ��ȡͼ���
                 
  Sy=imread('hd.bmp');  % ��Ƕ���ˮӡ��Ϣ
%     Sy=imread('asy.bmp');  % ��Ƕ������Һ��ˮӡ��Ϣ

[m,n]=size(I);

P=0.5;   %��ѻָ�����P,ͳ�Ƶó�
fi=5;  %��Ҫ��������Ĳ��� 

pic=1;   % ѡ��ԭʼͼ�����Ĵ�С
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

I1=zeros(kx,ky);
I2=zeros(m,n);   % ����ͼ���ֵ
rx=kx/2;  % rx*ry С��ϵ����ģ
ry=ky/2;
M=m/kx;    % ���п���
N=n/ky;     % ���п���
Numbers=M*N;   % �ܿ���

% �������� 
 B=zeros(1,Numbers);            % ����ϵ��
 T=zeros(1,Numbers);            % ����ϵ��
 Sita=zeros(1,Numbers);         % ����ϵ��
 Deta=zeros(1,Numbers);         % ��������
 switch pic                     % MAXb�ɸ��ݹ�ʽ(3)����ó�,MAXt�ɸ���vein.m�ó�
    case 1
        MAXb=8160*1024;
        MAXt=1738*1024;
    case 2
        MAXb=8160*256;
        MAXt=1738*256;
    case 3
        MAXb=8160*64;
        MAXt=1738*64;
    case 4
        MAXb=8160*16;
        MAXt=1738*16;
    case 5
        MAXb=8160*4;
        MAXt=1738*4;
    case 6
        MAXb=8160;
        MAXt=1738;
end
MAXs=45; % MAXs�ɸ���vein.m�ó�

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
        tmp=I(((i-1)*kx+1):(i*kx),((j-1)*ky+1):(j*ky));    % ��ȡͼ���
        Tmp=Sy(((i-1)*rx+1):(i*rx),((j-1)*ry+1):(j*ry));   % ��ȡˮӡ��
        [cA1,cH1,cV1,cD1]=dwt2(tmp,'haar');    % haarС���任
                      
        B(1,k)=sum(sum(cA1));   % ����ϵ��
        T(1,k)=sum(sum(abs(cH1)))+sum(sum(abs(cV1)))+sum(sum(abs(cD1)));  % ����ϵ��
        Sita(1,k)=(std(reshape(cH1,rx*ry,1))+std(reshape(cV1,rx*ry,1))+std(reshape(cD1,rx*ry,1)))/3; % ����ϵ��
        Sum(1,k)=B(1,k)/MAXb+20*T(1,k)/MAXt+20*Sita(1,k)/MAXs;
        Z(1,k)=statistic(tmp);  % ƽ���̶��ж�����
        
       if Sum(1,k)>=4 & Sum(1,k)<=25 & Z(1,k)<0.4
           Deta(1,k)=round(log(Sum(1,k)+1)*fi);% ��һ��ͼ����������
         elseif Sum(1,k)>=4 & Sum(1,k)<=25 & Z(1,k)>=0.4
           Deta(1,k)=round(log(Sum(1,k)+1)*0.5*fi);% �ڶ���ͼ����������
         elseif Sum(1,k)<4
           Deta(1,k)=round(log(Sum(1,k)+1)*fi);% ������ͼ���������� 
         elseif Sum(1,k)>25
           Deta(1,k)=round(log(Sum(1,k)+1)*1.2*fi);% ������ͼ����������
       end

      Q=floor(cA1/Deta(1,k));  % ����LLϵ��
        
         for p=1:rx      % ����cA1��ϵ��ֵΪS
            for q=1:ry
               if mod(Q(p,q),2)==Tmp(p,q)
                      if cA1(p,q)>0
                         S(p,q)=Q(p,q)*Deta(1,k)+Deta(1,k)*P;
                          if S(p,q)>510
                              S(p,q)=(Q(p,q)-2)*Deta(1,k)+Deta(1,k)*P;
                          end
                      else
                          S(p,q)=Q(p,q)*Deta(1,k)-Deta(1,k)*P;
                      end
                  else
                      if cA1(p,q)>0 
                         if rem(cA1(p,q),Deta(1,k)) > Deta(k)*P
                             S(p,q)=(Q(p,q)+1)*Deta(1,k)+Deta(1,k)*P;
                            if S(p,q)>510
                                S(p,q)=(Q(p,q)-2)*Deta(1,k)+Deta(1,k)*P;
                            end
                         else
                             S(p,q)=(Q(p,q)-1)*Deta(1,k)+Deta(1,k)*P;
                            if Q(p,q)==0
                             S(p,q)=(Q(p,q)+1)*Deta(1,k)+Deta(1,k)*P;
                           end
                         end
                      else
                          if abs(rem(cA1(p,q),Deta(1,k))) > Deta(k)*P
                              S(p,q)=(Q(p,q)-1)*Deta(1,k)-Deta(1,k)*P;
                          else
                              S(p,q)=Q(p,q)*Deta(1,k)+Deta(1,k)*P;
                          end
                      end
                  end
              end
          end
         tmp1=IDWT2(S,cH1,cV1,cD1,'haar'); % С����任   
         
          I2(((i-1)*kx+1):(i*kx),((j-1)*ky+1):(j*ky))=tmp1;
%          for p1=1:rx
%            for q1=1:ry
%                tmp2=tmp1(1+(2*(p1-1)):2*p1,1+(2*(q1-1)):2*q1);  % ��ȡͼ��2*2��
%                I1(1+(2*(p1-1)):2*p1,1+(2*(q1-1)):2*q1)=tiaozheng(tmp2);  %����ϵ��  
%            end
%         end
%          I2(((i-1)*kx+1):(i*kx),((j-1)*ky+1):(j*ky))=I1;  % ��ӵ�����ͼ����ȥ
%          k=k+1;  % ������һ��ͼ���
   end
end

figure,imshow(I),title('ԭʼͼ��');
figure,imshow(Sy),title('���Һ��ˮӡͼ��');
figure,imshow(uint8(I2)),title('����ͼ��');
imwrite(uint8(I2),'Watermarked.bmp');

% figure(3),imshow(uint8(round(tmp1))),title('Watermarked');
% imwrite(uint8(round(tmp1)),'Watermarked.bmp');

%    B
%    T
%    Sita
     Deta
   Sum
   Z