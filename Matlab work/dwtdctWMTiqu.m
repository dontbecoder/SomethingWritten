I=zeros(m,n);
select=6;                       % ѡ������ͼ��
switch select
    case 1
        I=round(TI);
    case 2
        I=TI;
    case 3
        I=imread('Watermarked.bmp');
    case 4
        I=I1;
    case 5
        I=imread('gongjihou.bmp');
    case 6
        I=imread('gongjihou4.jpg');
end
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
tmp=zeros(8,8);              % ͼ���ȡ�Ŀ�
tmp1=zeros(1,64);             % ͼ���ȡ�Ŀ�2
tmp1a=zeros(1,64);
sy=zeros(u,v);            % ��ȡ��ˮӡ��
sy1=zeros(1,BC*BC);
Tmp=zeros(BC,BC);              % ��ȡ��ˮӡ��
Deta=6;

for i=1:M
    for j=1:N
        C=cA1(((i-1)*8+1):(i*8),((j-1)*8+1):(j*8));                                              % ��ȡͼ���
        tmp=dct2(C);
        tmp1a=gzigzag1(tmp);                         % ��ȡͼ���
        tmp1a(:)=round(tmp1a(:)/Deta);
          for a=1:BC*BC                             % ��Ƶ
            sy1(a)=mod(tmp1a(a+3),2);
            end
           SY=reshape(sy1,BC,BC);
           sy(((i-1)*BC+1):(i*BC),((j-1)*BC+1):(j*BC))=SY;                                         % ��ȡˮӡ��
     end
 end
 figure,imshow(logical(sy)),title('Watermark fetched');
imwrite(logical(sy),'Watermarkfetched.bmp');
 