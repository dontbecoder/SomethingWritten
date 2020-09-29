%�����Ӿ��ڱεİ����ˮӡ�����о� 
%������ ���ӱ ������ �Ժ�
%�й�ͼ��ͼ��ѧ�� Vol.10 No.12 Dec.2005��1548-1553
clc;
clear;
close all;

turnkey=9;                             % ѡ��ԭʼͼ��
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
    case 9
        I=imread('len512.bmp');            %512*512
end
        
Sy=imread('hd1.bmp');           % ��Ƕ���ˮӡ��Ϣ    32*32

[m,n]=size(I);
[m1,n1]=size(Sy);
I1=zeros(m,n);                 % ����ͼ���ֵ
L=2;                           % 2��С���任

rx=m/2;                       % 1��С��ϵ����ģ
ry=n/2;                       % 1��С��ϵ����ģ

M=rx/2;                        % 2��С��ϵ����ģ
N=ry/2;                        % 2��С��ϵ����ģ

Numbers=m*n/(m1*2^L*n1*2^L);                   % ���С   ÿ16bitǶ��1bitˮӡ

% �������� 



 
cA2=zeros(M,N);              % LLϵ��
cH2=zeros(M,N);              % LHϵ��
cV2=zeros(M,N);              % HLϵ��
cD2=zeros(M,N);              % HHϵ��


        [cA1,cH1,cV1,cD1]=dwt2(I,'haar');                                                          % haarС���任
        [cA2,cH2,cV2,cD2]=dwt2(cA1,'haar');

        for i=1:32
            for j=1:32
                tmp=cA2(((i-1)*4+1):(i*4),((j-1)*4+1):(j*4));            %LL
                tmp1=cH2(((i-1)*4+1):(i*4),((j-1)*4+1):(j*4));           %LH
                tmp2=cV2(((i-1)*4+1):(i*4),((j-1)*4+1):(j*4));           %HL
                S=sum(sum(abs(tmp)));
                A=sum(sum(abs(tmp1)));
                B=sum(sum(abs(tmp2)));
                Deta=log((A+B)/2);                                      %��������                
                Q=round(S/Deta);                                        % ����
       
         for ii=1:4
              for jj=1:4
                   if mod(Q,2)~=Sy(i,j)
                              if tmp(ii,jj)>=0
                                   tmpZ(ii,jj)=tmp(ii,jj)-sign(tmp(ii,jj))*Deta/2+rem(tmp(ii,jj),Deta);
                              else
                                   tmpZ(ii,jj)=tmp(ii,jj)-sign(tmp(ii,jj))*Deta/2-rem(tmp(ii,jj),Deta);                          
                               end
                    else
                              if tmp(ii,jj)>=0
                                   tmpZ(ii,jj)=tmp(ii,jj)+sign(tmp(ii,jj))*Deta/2-rem(tmp(ii,jj),Deta);
                              else
                                   tmpZ(ii,jj)=tmp(ii,jj)+sign(tmp(ii,jj))*Deta/2+rem(tmp(ii,jj),Deta);                          
                               end
                           end
                   end
              end            
          end
          
           cA21(((i-1)*4+1):(i*4),((j-1)*4+1):(j*4))=tmpZ;
           
        end
    end
            CA1=idwt2(cA21,cH2,cV2,cD2,'haar');                             % С����任  
            I2=idwt2(CA1,cH1,cV1,cD1,'haar');                                % С����任
 

figure(1),imshow(I),title('Original');
figure(2),imshow(Sy),title('Watermark');
figure(3),imshow(uint8(round(I2))),title('Watermarked');
imwrite(uint8(I2),'Watermarked.bmp');




