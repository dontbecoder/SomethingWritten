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
        I=rgb2gray(imread('tu1.jpg'));     
    case 4
        I=rgb2gray(imread('len1.jpg'));      
    case 5
        I=rgb2gray(imread('8.bmp'));      
    case 6
        I=imread('len1.tif');
    case 7
        I=imread('len1.bmp');
    case 8
        I=imread('len2.bmp');
end
        
Sy=imread('hd2.bmp');   
  
[m,n]=size(I);
rx=m/2;                       % rx*ry С��ϵ����ģ
ry=n/2;

cA1=zeros(rx,ry);              % LLϵ��
cH1=zeros(rx,ry);              % LHϵ��
cV1=zeros(rx,ry);              % HLϵ��
cD1=zeros(rx,ry);              % HHϵ��
        
[cA1,cH1,cV1,cD1]=dwt2(I,'haar');   

M=rx/8;
N=ry/8;
Numbers=M*N;
[u v]=size(Sy);
SNumbers=u*v/Numbers; 
BC=sqrt(SNumbers); 

tmp=zeros(8,8);              % ͼ���ȡ�Ŀ�
tmp1=zeros(1,64);             % ͼ���ȡ�Ŀ�2
tmp1a=zeros(1,64);
Tmp=zeros(BC,BC);              % ��ȡ��ˮӡ��
Deta=6;

for i=1:M
    for j=1:N
       
        A=cA1(((i-1)*8+1):(i*8),((j-1)*8+1):(j*8));   
         tmp=dct2(A);
        Tmp=Sy(((i-1)*BC+1):(i*BC),((j-1)*BC+1):(j*BC));                                         % ��ȡˮӡ��
        Tmp1=reshape(Tmp,1,BC*BC); 
        tmp1a=gzigzag1(tmp);                            % ��ȡͼ���
        tmp1a(4:19)=round(tmp1a(4:19)/Deta);              %����
        for  a=1:BC*BC                                        % ��Ƶ
             if mod(tmp1a(a+3),2)==Tmp1(a)
                 tmp1a(a+3)=(tmp1a(a+3)*Deta);
             else 
                 tmp1a(a+3)=((tmp1a(a+3)-1)*Deta);
             end
         end
          tmp=gzigzagINVERSE(tmp1a);
          cA1(((i-1)*8+1):(i*8),((j-1)*8+1):(j*8))=idct2(tmp);
        end
 end
 TI=idwt2(cA1,cH1,cV1,cD1,'haar');
 figure(2),imshow(Sy),title('Watermark');
 imwrite(uint8(round(TI)),'Watermarked.bmp');
 figure(3),imshow(uint8(round(TI))),title('Watermarked');