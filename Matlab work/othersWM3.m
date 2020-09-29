%һ�ֻ�������Ӧ�����İ����ͼ��ˮӡ�㷨
%������ ���ӱ ����
%С��΢�ͼ����ϵͳ Vol.27 No.5 Nov.2006��896-900
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
        I=imread('len2.bmp');              %256*256
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

Numbers=m*n/(m1*2^L*n1*2^L);                   % ���С   ÿ4bitǶ��1bitˮӡ

% �������� 



 
cA2=zeros(M,N);              % LLϵ��
cH2=zeros(M,N);              % LHϵ��
cV2=zeros(M,N);              % HLϵ��
cD2=zeros(M,N);              % HHϵ��


        [cA1,cH1,cV1,cD1]=dwt2(I,'haar');                                                          % haarС���任
        [cA2,cH2,cV2,cD2]=dwt2(cA1,'haar');

        for i=1:32
            for j=1:32
                tmp=cV2(((i-1)*2+1):(i*2),((j-1)*2+1):(j*2));            %LH
                tmp1=cA2(((i-1)*2+1):(i*2),((j-1)*2+1):(j*2));           %LL
                tmp2=cH2(((i-1)*2+1):(i*2),((j-1)*2+1):(j*2));           %HL
                S=sum(sum(abs(tmp)));
                A=sum(sum(abs(tmp1)));
                B=sum(sum(abs(tmp2)));
                Deta=log((A+B)/2);                                      %��������                
                Q=round(S/Deta);                                        % ����
       
         for ii=1:2
              for jj=1:2
                   if mod(Q,2)~=Sy(i,j)
                         if Sy(i,j)==0
                               if tmp(ii,jj)>Deta
                                  tmpZ(ii,jj)=round(tmp(ii,jj)/Deta)*Deta-1;
                              elseif tmp(ii,jj)<-Deta
                                   tmpZ(ii,jj)=round(tmp(ii,jj)/Deta)*Deta+1;
                               elseif abs(tmp(ii,jj))<=abs(Deta)
                                   tmpZ(ii,jj)=tmp(ii,jj);
                               end
                           else
                               if abs(tmp(ii,jj))>abs(Deta)
                                   tmpZ(ii,jj)=round(tmp(ii,jj)/Deta)*Deta;
                               elseif abs(tmp(ii,jj))<=abs(Deta)
                                   tmpZ(ii,jj)=tmp(ii,jj);
                               end
                           end
                   else
                       tmpZ(ii,jj)=tmp(ii,jj);
                   end
              end            
          end
          
           cV21(((i-1)*2+1):(i*2),((j-1)*2+1):(j*2))=tmpZ;
           
        end
    end
            CV1=idwt2(cA2,cH2,cV21,cD2,'haar');                             % С����任  
            I2=idwt2(cA1,cH1,CV1,cD1,'haar');                                % С����任
 

figure(1),imshow(I),title('Original');
figure(2),imshow(Sy),title('Watermark');
figure(3),imshow(uint8(I2)),title('Watermarked');
imwrite(uint8(I2),'Watermarked.bmp');




