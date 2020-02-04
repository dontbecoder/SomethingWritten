%���������Ӿ��İ���ˮӡ--ˮӡ��ȡ   ����ҵ���ĳ���
% clear;
% close all;

select=1;  % ѡ������ͼ��
switch select
    case 1
        I=imread('Watermarked.bmp');
    case 2
        I=imread('gongjihou.bmp');
    case 3
        I=imread('gongjihou3.jpg');
end

[m,n]=size(I);

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
               
        tmp=I(((i-1)*kx+1):(i*kx),((j-1)*ky+1):(j*ky));  % ��ȡͼ���
        [cA1,cH1,cV1,cD1]=dwt2(tmp,'haar');  % haarС���任
        Deta(1,k)=11;  %��Ƕ��ʱ����һ��
        
        Q=floor(cA1/Deta(1,k));  % ����LLϵ��
        
        Tmp=mod(Q,2);
        sy(((i-1)*rx+1):(i*rx),((j-1)*ry+1):(j*ry))=Tmp;
       k=k+1;  % ������һ��ͼ���
    end
end

 figure,imshow(logical(sy)),title('Watermark fetched');
imwrite(logical(sy),'sy1.bmp');
imwrite(logical(sy),'Watermarkfetched.bmp');

