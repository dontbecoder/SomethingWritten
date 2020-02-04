%���������Ӿ��İ���ˮӡ--ˮӡ��ȡ

select=1;                       % ѡ������ͼ��
switch select
    case 1
        I=round(TI);
    case 2
        I=TI;
    case 3
        I=imread('watermarked.bmp');
end

[m,n]=size(I);
[M,N]=size(Sy);
P=4;                           % Ƕ��һλˮӡ��Ϣ��С��ϵ�����С
Q=4;
kx=256;                        % ͼ����С
ky=256;
MAXb=8160*1024;                
MAXt=2100*1024;
sy=zeros(M,N);

rx=kx/2;                       % rx*ry С��ϵ����ģ
ry=ky/2;
I1=zeros(P,Q);                 % ����ͼ���ֵ

% ��������

B=0;                           % ����ϵ��
T=0;                           % ����ϵ��
Sita=0;                        % ����ϵ��
%Deta=0;                        % ��������

cA1=zeros(rx,ry);              % LLϵ��
cH1=zeros(rx,ry);              % LHϵ��
cV1=zeros(rx,ry);              % HLϵ��
cD1=zeros(rx,ry);              % HHϵ��

Qq=zeros(M,N);                 % ����ֵ

tmp=zeros(kx,ky);              % ԭʼͼ���ȡ�Ŀ�
tmp1=zeros(kx,ky);             % ����ϳɿ�

%tmp=I(((i-1)*kx+1):(i*kx),((j-1)*ky+1):(j*ky));                                                      % ��ȡͼ���
tmp=I;
[cA1,cH1,cV1,cD1]=dwt2(tmp,'haar');                                                                  % haarС���任

B=sum(sum(cA1))/MAXb;                                                                                % ����ϵ��
T=(sum(sum(abs(cH1)))+sum(sum(abs(cV1)))+sum(sum(abs(cD1))))/MAXt;                                   % ����ϵ��
Sita=(std(reshape(cH1,rx*ry,1))+std(reshape(cV1,rx*ry,1))+std(reshape(cD1,rx*ry,1)))/3;              % ����ϵ��
% Deta=B*T*Sita*fi;                                                                                    % ��������
% if Deta<=0.01                                                                                      % ������������
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
        sy(i,j)=mod(Qq(i,j),2);
    end
end

figure,imshow(logical(sy)),title('Watermark fetched');
imwrite(logical(sy),'Watermarkfetched.bmp');

B
T
Sita
Deta

DetaSave1=Qq;

% End on 2006-08-18-12:13