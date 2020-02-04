%                              ����֤ˮӡ��ȡ����
select=4;                       % ѡ������ͼ��
switch select
    case 1
        I=round(I1);
    case 2
        I=TI;
    case 3                              %������ȡ
        I=imread('Watermarked.bmp');
    case 4
        I=imread('Watermarked1.bmp');;
    case 5                               %��ͨ��������ȡ
        I=imread('gongjihou.bmp');
    case 6
        I=imread('watermarked.jpg');
    case 7                                %jpegѹ������ȡ
        I=imread('gongjihou4.jpg');
end
[m,n]=size(I);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
I2=bitand(I,1);  %��ȡ���λ

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x=zeros(1,65536);
x(1,1)=0;
J=10;
z=zeros(m,n);


a=zeros(1,65536);
b=[1 0 1 0 1 0 1 0];                          %  LFSR ��ʼֵ11001100
for i=1:65536
    a(1,i)=b(1,1);
    for j=1:7
        b(1,j)=b(1,j+1);
    end
    tp=xor(b(1,8),b(1,4));
    tp1=xor(tp,b(1,3));
    b(1,8)=xor(tp1,b(1,2));
end

I1=bitand(I,254);  %���λ����


for i=1:m
    for j=1:n
        tmp=double(I1(i,j))/255;
        x(1,1)=tmp;
        for k=1:256
            x(1,k+1)=sqrt(abs(2*x(1,k)-1));
                if a(1,k)==1
                 x(1,k+1)=1-x(1,k+1);
                end
        end
        count=double(I1(i,j))+1; %ѡ�����е�I1(i,j)��Ԫ��
        z(i,j)=mod(fix(x(count)*2^J),2);   %�õ�Z
        
        X1=dec2bin(double(I(i,j)));
        if length(X1)<8
            cha=8-length(X1);
            kong=blanks(8);
            kong(1:cha)='0';
            kong(cha+1:end)=X1;
            X1=kong;
        end
        r=mod(floor(x(count)*255),7)+1;    %�õ�r
        Info=xor(z(i,j),X1(r));
%         I1(i,j)=bitor(I1(i,j),Info);
        Endbit=int2str(Info);
        X1(end)=Endbit;
        I1(i,j)=bin2dec(X1);
    end
end
I3=bitand(I1,1);  %��ȡ���λ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

I4=(I2==I3);
imshow(~I4),title('������')
imwrite(~I4,'watermarkedfetched.bmp')