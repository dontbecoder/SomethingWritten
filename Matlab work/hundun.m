% ��    �ܣ� �������ϻ��綯��ϵͳ��ͼ�����
% ʹ�÷�ʽ�� rr1
% ����˵���� g0-������λ�Ĵ����ĳ�ʼֵ,x0-���ϻ��綯��ϵͳ�ĳ�ʼֵ
% �� �� ֵ�� �μ������������WORKSPACE�ı���ֵ

% PART 0: ��������
clear;
clc;
% ��Կֵ
g0='11001100';
x0=double(0.607);
% ������λ�Ĵ����������м�ֵ
g=g0;
% ͳ�Ʒ�����λ�Ĵ��������λ0/1�ĸ���
countq0=0;
countq1=0;
% ͳ��ת�����ӵ����λ0/1�ĸ���
countc0=0;
countc1=0;
% ͳ�����ĵ����λ0/1�ĸ���
countm0=0;
countm1=0;
% ���ϻ��綯��ϵͳ�ĳ�ʼֵ��ֵ
x=double(0);
x=x0;
% ת�����ӵĳ�ʼֵ
J=10;
mi='0';
ri='0';
ci='0';
q='0';
c=0;
X0=double(0);
% ͼ����
YSTX=imread('ystx.bmp');
ystx=rgb2gray(YSTX);
figure,imshow(ystx);
[M,N]=size(ystx);
K=M*N;
result=uint8(zeros(M,N)); 
TMP=uint8(0);
tmp='00000000';
i=1;  
while (i<=K)
    col=mod(i,N);
    if (col==0)
        row=int8(i/N);
        col=N;
    else
        row=int8(double(int8(i/N))+1);
    end
    TMP=ystx(row,col);
    tmp=dec2bin(double(TMP),8);
    C=0;
    I=1;
    while (I<=8)
        % PART 1: ������λ�Ĵ������R={ri}
        ri=g(8);
        mi=tmp(9-I);
        if mi=='0'
            countm0=countm0+1;
        else
            countm1=countm1+1;
        end;
        % ͳ�����λ0/1�ĸ���
        if ri==mi
            q='0';
            countq0=countq0+1;
        else
            countq1=countq1+1;
            q='1';
        end;
        % PART 2: ���ϻ��綯��ϵͳ����[0��1]֮������� 
        % ѡ���ӻ��綯��ϵͳ�����������µĻ���ֵ
        x=1-sqrt(abs(2*x-1));
        if (q=='0')
            x=1-x;
        end
        % PART 3: ת������
        % ����ת������R��ת��,ע��J�����ִ�С���Ա�ѡ��int8/int16/int32����
        % ѡ������ȡ��
        c=mod(floor(x*(2^J)),2);
        C=C+c*2^(I-1);
        if (c==0)
            ci='0';
            countc0=countc0+1;
        else
            ci='1';
            countc1=countc1+1;
        end
        % �����ͷ8��4��3��2λ�����ֵ��Ϊ���λ8����ֵ, ע��˳��
        k ='0';
        k1='0';
        k2='0';
        if (g(1)==g(5))
            k1='0';
        else
            k1='1';
        end
        if (g(6)==g(7))
            k2='0';
        else
            k2='1';
        end
        if (k1==k2)
            k='0';
        else
            k='1';
        end
        JJ=7;
        while (JJ>0)
            g(JJ+1)=g(JJ);
            JJ=JJ-1;
        end
        % Method 1
        g(1)=k;
        % Method 2
%         if (k==ci)
%             g(1)='0';
%         else
%             g(1)='1';
%         end
         I=I+1;
    end    
    result(row,col)=uint8(C);
    % ����������1
    i=i+1;
end
% PART 4: ͳ�����
figure,imshow(result);
imwrite(result,'result.bmp','BMP');

% ��    �ܣ� �������ϻ��綯��ϵͳ��ͼ�����
% ʹ�÷�ʽ�� rr2
% ����˵���� g0-������λ�Ĵ����ĳ�ʼֵ,x0-���ϻ��綯��ϵͳ�ĳ�ʼֵ
% �� �� ֵ�� �μ������������WORKSPACE�ı���ֵ

% PART 0: ��������
% ��Կֵ
clear;
clc;
g0='11001100';
x0=double(0.607);
% ������λ�Ĵ����������м�ֵ
g=g0;
% ���ϻ��綯��ϵͳ�ĳ�ʼֵ��ֵ
x=double(0);
x=x0;
% ͳ�Ʒ�����λ�Ĵ��������λ0/1�ĸ���
countq0=0;
countq1=0;
% ͳ��ת�����ӵ����λ0/1�ĸ���
countc0=0;
countc1=0;
% ͳ�����ĵ����λ0/1�ĸ���
countm0=0;
countm1=0;
% ת�����ӵĳ�ʼֵ
J=10;
% ͼ����
result0=imread('result.bmp');
figure,imshow(result0);
[M,N]=size(result0);
K=M*N;
ystx0=uint8(zeros(M,N)); 
i=1;
ri='0';
ci='0';
SI=0;
si='0';
q='0';
qq='0';
mi=0;
c=0;
X0=double(0);
TMP=uint8(0);
tmp='00000000';
while (i<=K)
    col=mod(i,N);
    if (col==0)
        row=int8(i/N);
        col=N;
    else
        row=int8(double(int8(i/N))+1);
    end
    TMP=result0(row,col);
    tmp=dec2bin(double(TMP),8);
    C=0;
    I=1;
    while (I<=8)
        % PART 1: ������λ�Ĵ������ri
        ri=g(8);
        ci=tmp(9-I);
        if ci=='0'
            countc0=countc0+1;
        else
            countc1=countc1+1;
        end
        x=1-sqrt(abs(2*x-1));
        % ����ת������R��ת��,ע��J�����ִ�С
        % ѡ������ȡ��
        SI=mod(floor(x*(2^J)),2);
        if (SI==0)
            si='0';
        else
            si='1';
        end
        if ( ci == si )
            q='1';
            countq1=countq1+1;
        else
            q='0';
            countq0=countq0+1;
        end
        if q==ri
            mi=0;
            countm0=countm0+1;
        else
            mi=1;
            countm1=countm1+1;
        end
        C=C+mi*2^(I-1);
        % �����ͷ8��4��3��2λ�����ֵ��Ϊ���λ8����ֵ, ע��˳��
        k ='0';
        k1='0';
        k2='0';
        if (g(1)==g(5))
            k1='0';
        else
            k1='1';
        end
        if (g(6)==g(7))
            k2='0';
        else
            k2='1';
        end
        if (k1==k2)
            k='0';
        else
            k='1';
        end
        JJ=7;
        while (JJ>0)
            g(JJ+1)=g(JJ);
            JJ=JJ-1;
        end
        % Method 1
        g(1)=k;
        % Method 2
        I=I+1;
        
    end    
    ystx0(row,col)=uint8(C);
    % ����������1
    i=i+1;
end
% PART 4: ͳ�����
figure,imshow(ystx0);
imwrite(ystx0,'ystx0.bmp','BMP');
