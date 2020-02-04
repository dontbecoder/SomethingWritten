%���������Ӿ��İ���ˮӡ--ˮӡǶ��
% clc;
% clear;
% close all;

fi=10;                               % ��Ҫ��������Ĳ���
% Deta=1;

turnkey=1;                             % ѡ��ԭʼͼ��
switch turnkey
    case 1
        I=imread('cameraman.tif');     % ԭʼͼ��cameraman
    case 2
        I=rgb2gray(imread('50.bmp'));  % ԭʼͼ��Lena
    case 3
        I=rgb2gray(imread('face.png'));     
    case 4
        I=rgb2gray(imread('hua.png'));      
    case 5
        I=rgb2gray(imread('10.bmp'));      
end
[m,n]=size(I);
        
Sy=imread('sy.bmp');           % ��Ƕ���ˮӡ��Ϣ
[M,N]=size(Sy);                % С��ϵ�����ֵ������п���
P=4;                           % Ƕ��һλˮӡ��Ϣ��С��ϵ�����С
Q=4;
kx=256;                        % ͼ����С
ky=256;
MAXb=8160*1024;                
MAXt=2100*1024;

rx=kx/2;                       % rx*ry С��ϵ����ģ
ry=ky/2;
I1=zeros(P,Q);                 % ����ͼ���ֵ

% ��������

% B=0;                           % ����ϵ��
% T=0;                           % ����ϵ��
% Sita=0;                        % ����ϵ��
% Deta=0;                        % ��������

cA1=zeros(rx,ry);              % LLϵ��
cH1=zeros(rx,ry);              % LHϵ��
cV1=zeros(rx,ry);              % HLϵ��
cD1=zeros(rx,ry);              % HHϵ��

Qq=zeros(M,N);                 % ����ֵ
S=zeros(rx,ry);                % �������cA1ϵ��

tmp=zeros(kx,ky);              % ԭʼͼ���ȡ�Ŀ�
tmp1=zeros(kx,ky);             % ����ϳɿ�

%tmp=I(((i-1)*kx+1):(i*kx),((j-1)*ky+1):(j*ky));                                                     % ��ȡͼ���
tmp=I;
[cA1,cH1,cV1,cD1]=dwt2(tmp,'haar');                                                                  % haarС���任

B=sum(sum(cA1))/MAXb;                                                                                % ����ϵ��
T=(sum(sum(abs(cH1)))+sum(sum(abs(cV1)))+sum(sum(abs(cD1))))/MAXt;                                   % ����ϵ��
Sita=(std(reshape(cH1,rx*ry,1))+std(reshape(cV1,rx*ry,1))+std(reshape(cD1,rx*ry,1)))/3;              % ����ϵ��
Deta=B*T*Sita*fi;                                                                                    % ��������
% if Deta<=0.01                                                                                        % ������������
%     Deta=0.01;
% else
%     if Deta>=2.0
%         Deta=log(Deta);
%     else
%         Deta=Deta/2;
%     end
% end
% Deta=round(Deta);

for i=1:M
    for j=1:N
        I1=cA1(((i-1)*P+1):(i*P),((j-1)*Q+1):(j*Q));                           % ȡС��ϵ����
        ti=sum(sum(I1));
        Qq(i,j)=floor(ti/Deta);
        nk=sum(sum(floor(I1/Deta)));
        
        if Sy(i,j)==0
            if mod(nk,2)==0
                T1=I1+Deta/2-rem(I1,Deta);
            else
                T1=I1+Deta/2-rem(I1,Deta);
                T1(1,1)=T1(1,1)-Deta/2;
                T1(1,2)=T1(1,2)-Deta/2;
            end
        else
             if mod(nk,2)==0
                T1=I1+Deta/2-rem(I1,Deta);
                T1(1,1)=T1(1,1)-Deta/2;
                T1(1,2)=T1(1,2)-Deta/2;
            else
                T1=I1+Deta/2-rem(I1,Deta);
            end
        end
        S(((i-1)*P+1):(i*P),((j-1)*Q+1):(j*Q))=T1;
    end
end

tmp1=IDWT2(S,cH1,cV1,cD1,'haar');                                              % С����任     

TI=tmp1;

figure(1),imshow(I),title('Original');
figure(2),imshow(Sy),title('Watermark');
figure(3),imshow(uint8(round(TI))),title('Watermarked');
imwrite(uint8(round(TI)),'Watermarked.bmp');
%imwrite(uint8(floor(TI)),'Watermarked.bmp');

B
T
Sita
Deta

DetaSave0=Qq;
