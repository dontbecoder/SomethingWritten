%���������Ӿ��İ���ˮӡ--ˮӡ��ȡ
I=zeros(m,n);
select=3;                       % ѡ������ͼ��
switch select
    case 1
        I=round(TI);
    case 2
        I=TI;
    case 3
        I=imread('watermarked.bmp');
    case 4
        I=I1;
end

[m,n]=size(I);

%pic=1;                         % ѡ��ͼ����С����bcrsy.m��һ������
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

sy=zeros(m/2,n/2);
B=zeros(1,Numbers);            % ����ϵ��
T=zeros(1,Numbers);            % ����ϵ��
Sita=zeros(1,Numbers);         % ����ϵ��
Deta=zeros(1,Numbers);         % ��������

switch pic
    case 1
        MAXb=8160*1024;
        MAXt=2100*1024;
    case 2
        MAXb=8160*256;
        MAXt=2100*256;
    case 3
        MAXb=8160*64;
        MAXt=2100*64;
    case 4
        MAXb=8160*16;
        MAXt=2100*16;
    case 5
        MAXb=8160*4;
        MAXt=2100*4;
    case 6
        MAXb=8160;
        MAXt=2100;
end

cA1=zeros(rx,ry);              % LLϵ��
cH1=zeros(rx,ry);              % LHϵ��
cV1=zeros(rx,ry);              % HLϵ��
cD1=zeros(rx,ry);              % HHϵ��

Dt=1;                          % ��������
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
        [cA1,cH1,cV1,cD1]=dwt2(tmp,'haar');                                                          % haarС���任
        
        B(1,k)=sum(sum(cA1))/MAXb;                                                                   % ����ϵ��
        T(1,k)=(sum(sum(abs(cH1)))+sum(sum(abs(cV1)))+sum(sum(abs(cD1))))/MAXt;                      % ����ϵ��
        Sita(1,k)=(std(reshape(cH1,rx*ry,1))+std(reshape(cV1,rx*ry,1))+std(reshape(cD1,rx*ry,1)))/3; % ����ϵ��
        Deta(1,k)=B(1,k)*T(1,k)*Sita(1,k)*fi;                                                        % ��������

        if Deta(1,k)<=0.01                                                                           % ����������������һ
            Deta(1,k)=0.01;
        else
            if Deta(1,k)>=2.0
                Deta(1,k)=log(Deta(1,k));
            end
        end
        
        Q=floor(cA1/Deta(1,k));                                                                      % ����LLϵ��
        
        Tmp=mod(Q,2);
        sy(((i-1)*rx+1):(i*rx),((j-1)*ry+1):(j*ry))=Tmp;
 
%         if k==436                                                                                  % ����������Ĳ���                                     
%             clc
%             tmp
%             Tmp
%             B(1,k)
%             T(1,k)
%             Sita(1,k)
%             Deta(1,k)
%             pause
%         end
        
        k=k+1;                                                                                       % ������һ��ͼ���
    end
end

figure,imshow(logical(sy)),title('Watermark fetched');
imwrite(logical(sy),'Watermarkfetched.bmp');

figure;
subplot(2,2,1),plot (B(1,1:Numbers)); 
subplot(2,2,2),plot (T(1,1:Numbers)); 
subplot(2,2,3),plot (Sita(1,1:Numbers)); 
subplot(2,2,4),plot (Deta(1,1:Numbers)); 

DetaSave1=Deta;

% End on 2006-08-18-12:13