clc
clear
close all
% function Z=zuoyoujie(x)
x=imread('zuoyoujiamijieguo.tif');
[m n l]=size(x);
if l==3  %RGB
    X=cell(1,3);
       for h=1:3
           B=x(:,1:n/2,h);        %����
           B1=x(:,(n/2+1):n,h);   %�Ұ��
           N=m*n/2;
           d=zeros(m,n/2);
           d1=zeros(m,n/2);
           d2=zeros(m,n/2);
           Flag=zeros(1,N);
           Flag1=zeros(1,N);

%���������
C=reshape(B,1,N);
z1=sort(C);
for i=1:m
    for j=1:n/2
        for k=1:N
            if (B(i,j)==z1(1,k)&Flag1(1,k)==0)
                d(i,j)=k;
      
                Flag1(1,k)=1;
                break;
            end
        end
    end
end
%�����Ұ��
B1=B1';
L=reshape(B1,1,N);
 for k=1:N
    for i=1:m
         for j=1:n/2
             if k==d(i,j)
                d1(i,j)=L(k);
                break;
            end
        end
    end
end
%���Ұ�߾���ı�������
y=reshape(d1,1,N);
z=sort(y);
for i=1:m
    for j=1:n/2
        for k=1:N
            if (d1(i,j)==z(1,k)&Flag(1,k)==0)
                d(i,j)=k;
                Flag(1,k)=1;
                 
                break;
            end
        end
    end
end
%��������
B=B';
L1=reshape(B,1,N);
 for k=1:N
    for i=1:m
        for j=1:n/2
       
            if k==d(i,j)
              
                d2(i,j)=L1(k);
                break;
            end
        end
    end
end

X{h}=[d2 d1];
X{h}=uint8(X{h});
end
Z=cat(3,X{1},X{2},X{3});
imshow(Z)
imwrite(Z,'zuoyoujiemijieguo.tif');
else  %��rgbͼ��
    R=islogical(x);
    if R==0  %�Ҷ�ͼ��
B=x(:,1:n/2);
B1=x(:,(n/2+1):n);
N=m*n/2;
d=zeros(m,n/2);
d1=zeros(m,n/2);
d2=zeros(m,n/2);
Flag=zeros(1,N);
Flag1=zeros(1,N);

%���������
C=reshape(B,1,N);
z1=sort(C);
for i=1:m
    for j=1:n/2
        for k=1:N
            if (B(i,j)==z1(1,k)&Flag1(1,k)==0)
                d(i,j)=k;
      
                Flag1(1,k)=1;
                break;
            end
        end
    end
end
%�����Ұ��
B1=B1';
L=reshape(B1,1,N);
 for k=1:N
    for i=1:m
         for j=1:n/2
             if k==d(i,j)
                d1(i,j)=L(k);
                break;
            end
        end
    end
end
%���Ұ�߾���ı�������
y=reshape(d1,1,N);
z=sort(y);
for i=1:m
    for j=1:n/2
        for k=1:N
            if (d1(i,j)==z(1,k)&Flag(1,k)==0)
                d(i,j)=k;
                Flag(1,k)=1;
                 
                break;
            end
        end
    end
end
%��������
B=B';
L1=reshape(B,1,N);
 for k=1:N
    for i=1:m
        for j=1:n/2
       
            if k==d(i,j)
              
                d2(i,j)=L1(k);
                break;
            end
        end
    end
end

Y=[d2 d1];
Y=uint8(Y);
Z=Y;
else %��ֵͼ��
    B=x(:,1:n/2);
B1=x(:,(n/2+1):n);
N=m*n/2;
d=zeros(m,n/2);
d1=zeros(m,n/2);
d2=zeros(m,n/2);
Flag=zeros(1,N);
Flag1=zeros(1,N);

%���������
C=reshape(B,1,N);
z1=sort(C);
for i=1:m
    for j=1:n/2
        for k=1:N
            if (B(i,j)==z1(1,k)&Flag1(1,k)==0)
                d(i,j)=k;
      
                Flag1(1,k)=1;
                break;
            end
        end
    end
end
%�����Ұ��
B1=B1';
L=reshape(B1,1,N);
 for k=1:N
    for i=1:m
         for j=1:n/2
             if k==d(i,j)
                d1(i,j)=L(k);
                break;
            end
        end
    end
end
%���Ұ�߾���ı�������
y=reshape(d1,1,N);
z=sort(y);
for i=1:m
    for j=1:n/2
        for k=1:N
            if (d1(i,j)==z(1,k)&Flag(1,k)==0)
                d(i,j)=k;
                Flag(1,k)=1;
                 
                break;
            end
        end
    end
end
%��������
B=B';
L1=reshape(B,1,N);
 for k=1:N
    for i=1:m
        for j=1:n/2
       
            if k==d(i,j)
              
                d2(i,j)=L1(k);
                break;
            end
        end
    end
end

Y=[d2 d1];
Y=logical(Y);
Z=Y;
end
end
imshow(Z)
imwrite(Z,'zuoyoujiemijieguo.tif');