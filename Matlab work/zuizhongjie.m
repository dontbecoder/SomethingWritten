function zuizhongjie(filename)   %������
image=imread(filename);
start_time=cputime;
%%%%%%%%%%%%%%%%%%%%%%%�����ܳ�
a=zeros(1,128);
b=[1 1 0 0 1 1 0 0];                  %  L F S R ��ʼֵ11001100
for i=1:128
    a(i)=b(1);
    for j=1:7
        b(j)=b(j+1);
        tp=xor(b(8),b(4));
        tp1=xor(tp,b(3));
        b(8)=xor(tp1,b(2));
    end
end
j=10;
x=zeros(1,128);
x(1)=0.12345678;                             % �� �� �� �� �� ֵ0.1234567
c=zeros(1,128);
for k=1:128
    if a(k)==0      %����0��1ѡ����   
     x(k+1)=sqrt(abs(2*x(k)-1));
    else
        x(k+1)=1-sqrt(abs(2*x(k)-1));
    end
    c(k)=mod(fix(x(k)*2^j), 2);%ת������,�õ��ܳ�
end
c=rot90(c,2);                              % ������˳�򷴹�������Ϊ����˳��
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
%͵���ĵط�
c=[1 0 0];

  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Q=cell(1,127);
Q{1}=image;
for k=1:3
    if c(k)==0
        Q{k+1}=shangxiajie(Q{k});
    else
        Q{k+1}=zuoyoujie(Q{k});
    end
end
elapsed_time=cputime-start_time
% imwrite(Q{4},'jiemijieguo.tif');
% im=imread('jiemijieguo.tif');
imwrite(Q{4},'jiemijieguo.bmp');
im=imread('jiemijieguo.bmp');
imshow(image),title('������ͼ��');
figure,imshow(im),title('���ܽ��');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%shangxiajie
function Z=shangxiajie(x)
[m n l]=size(x);
if l==3   %RGB
      X=cell(1,3);
       for h=1:3
           B=x(1:m/2,:,h);                  %�ϰ��ͼ��
           B1=x((m/2+1):m,:,h);             %�°��ͼ��
           d=zeros(m/2,n);
           d1=zeros(m/2,n);            
           d2=zeros(m/2,n);    
           N=m*n/2;
%��־
Flag=zeros(1,N);
Flag1=zeros(1,N);

%���ϰ�ߵı�������
C=reshape(B,1,N);
z1=sort(C);
for i=1:m/2
    for j=1:n
        for k=1:N
            if (B(i,j)==z1(1,k)&Flag1(1,k)==0)
                d(i,j)=k;
               
                Flag1(1,k)=1;
                break;
            end
        end
    end
end
%�����°��
B1=B1';
L=reshape(B1,1,N);
 for k=1:N
    for i=1:m/2
         for j=1:n
        
            if k==d(i,j)
                d1(i,j)=L(k);
                break;
            end
        end
    end
end
%���°�ߵı�������
y=reshape(d1,1,N);
z=sort(y);
for i=1:m/2
    for j=1:n
        for k=1:N
            if (d1(i,j)==z(1,k)&Flag(1,k)==0)
                d(i,j)=k;
                Flag(1,k)=1;
               
                break;
            end
        end
    end
end
%�����ϰ��
B=B';
L1=reshape(B,1,N);
 for k=1:N
    for i=1:m/2
        for j=1:n
       
            if k==d(i,j)
                d2(i,j)=L1(k);
                break;
            end
        end
    end
end

X{h}=[d2;d1];
X{h}=uint8(X{h});
         end
Z=cat(3,X{1},X{2},X{3});

      else        %��rgbͼ��
          R=islogical(x);
          if  R==0      %�Ҷ�ͼ��
                    B=x(1:m/2,:);                  %�ϰ��ͼ��
                    B1=x((m/2+1):m,:);             %�°��ͼ��
                    d=zeros(m/2,n);
                    d1=zeros(m/2,n);            
                    d2=zeros(m/2,n);    
                    N=m*n/2;
%��־
Flag=zeros(1,N);
Flag1=zeros(1,N);

%���ϰ�ߵı�������
C=reshape(B,1,N);
z1=sort(C);
for i=1:m/2
    for j=1:n
        for k=1:N
            if (B(i,j)==z1(1,k)&Flag1(1,k)==0)
                d(i,j)=k;
               
                Flag1(1,k)=1;
                break;
            end
        end
    end
end
%�����°��
B1=B1';
L=reshape(B1,1,N);
 for k=1:N
    for i=1:m/2
         for j=1:n
        
            if k==d(i,j)
                d1(i,j)=L(k);
                break;
            end
        end
    end
end
%���°�ߵı�������
y=reshape(d1,1,N);
z=sort(y);
for i=1:m/2
    for j=1:n
        for k=1:N
            if (d1(i,j)==z(1,k)&Flag(1,k)==0)
                d(i,j)=k;
                Flag(1,k)=1;
               
                break;
            end
        end
    end
end
%�����ϰ��
B=B';
L1=reshape(B,1,N);
 for k=1:N
    for i=1:m/2
        for j=1:n
       
            if k==d(i,j)
                d2(i,j)=L1(k);
                break;
            end
        end
    end
end

X=[d2;d1];
X=uint8(X);
Z=X;
else        %��ֵͼ��
                    B=x(1:m/2,:);                  %�ϰ��ͼ��
                    B1=x((m/2+1):m,:);             %�°��ͼ��
                    d=zeros(m/2,n);
                    d1=zeros(m/2,n);            
                    d2=zeros(m/2,n);    
                    N=m*n/2;
%��־
Flag=zeros(1,N);
Flag1=zeros(1,N);

%���ϰ�ߵı�������
C=reshape(B,1,N);
z1=sort(C);
for i=1:m/2
    for j=1:n
        for k=1:N
            if (B(i,j)==z1(1,k)&Flag1(1,k)==0)
                d(i,j)=k;
               
                Flag1(1,k)=1;
                break;
            end
        end
    end
end
%�����°��
B1=B1';
L=reshape(B1,1,N);
 for k=1:N
    for i=1:m/2
         for j=1:n
        
            if k==d(i,j)
                d1(i,j)=L(k);
                break;
            end
        end
    end
end
%���°�ߵı�������
y=reshape(d1,1,N);
z=sort(y);
for i=1:m/2
    for j=1:n
        for k=1:N
            if (d1(i,j)==z(1,k)&Flag(1,k)==0)
                d(i,j)=k;
                Flag(1,k)=1;
               
                break;
            end
        end
    end
end
%�����ϰ��
B=B';
L1=reshape(B,1,N);
 for k=1:N
    for i=1:m/2
        for j=1:n
       
            if k==d(i,j)
                d2(i,j)=L1(k);
                break;
            end
        end
    end
end

X=[d2;d1];
X=logical(X);
Z=X;
     end
end
%zuoyoujie
function Z=zuoyoujie(x)

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