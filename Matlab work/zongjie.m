function zongjie(filename)   %������
image=imread(filename);
%%%%%%%%%%%%%%%%%%%%%%%�����ܳ�
a=zeros(1,128);
b=[1 1 0 0 1 1 0 0];%��ʼֵ
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
x(1)=0.1234567;
c=zeros(1,128);
for k=1:128
    if a(k)==0      %����0��1ѡ����   
     x(k+1)=sqrt(abs(2*x(k)-1));
    else
        x(k+1)=1-sqrt(abs(2*x(k)-1));
    end
    c(k)=mod(fix(x(k)*2^j), 2);%ת������,�õ��ܳ�
end
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Q=cell(1,127);
Q{1}=image;
for k=1:3
    if c(k)==0
        Q{k+1}=shangxiajiami2(Q{k});
    else
        Q{k+1}=zuoyoujiami2(Q{k});
    end
end

imwrite(Q{4},'jiamijieguo.tif')
im=imread('jiamijieguo.tif');
figure,imshow(im)


%shangxiajiami  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function Z=shangxiajiami2(x)

[m n l]=size(x);
if l==3      %RGBͼ��
     %�ж϶���ͼ���Ƿ�Ϊ�����������򲹳ɷ���
    X=cell(1,3);
    u=cell(1,3);
    for h=1:3
    u{h}=x(:,:,h);
    u{h}=u{h}';
    end
    x1=cat(3,u{1},u{2},u{3});
      for h=1:3
        if m>n
    n=m;
    x1(m,n,h)=0;
    N=m*n/2;
    x2=x1(:,(n/2+1):n,h);
    x3=x1(:,1:n/2,h);
    d=zeros(m,n/2);
          if mod(m,2)==1
           m=m+1;
           n=m;
           x1(m,n,h)=0;
           N=m*n/2;
           x2=x1(:,(n/2+1):n,h);
           x3=x1(:,1:n/2,h);
           d=zeros(m,n/2);
           end
    elseif m<n
         m=n;
         x1(m,n,h)=0;
         N=m*n/2;      
         x2=x1(:,(n/2+1):n,h);
         x3=x1(:,1:n/2,h);
         d=zeros(m,n/2);
         if mod(n,2)==1
             n=n+1;
             m=n;
             x1(m,n,h)=0;
             N=m*n/2;
             x2=x1(:,(n/2+1):n,h);
             x3=x1(:,1:n/2,h);
             d=zeros(m,n/2);
         end
  elseif m==n
     x2=x1(:,(n/2+1):n,h);
     x3=x1(:,1:n/2,h);
     N=m*n/2;
     d=zeros(m,n/2);
 end
%��־
Flag=zeros(1,N);
Flag1=zeros(1,N);

%���°�߾���ı�������3
y=reshape(x2,1,N);
z=sort(y);
for i=1:m
    for j=1:n/2
        for k=1:N
            if (x2(i,j)==z(1,k)&Flag(1,k)==0)
                d(i,j)=k;
                Flag(1,k)=1;
                break;
            end
        end
    end
end

%�ñ���������ϰ�߽�������
A=zeros(1,N);
for i=1:m
    for j=1:n/2
        for k=1:N
            if k==d(i,j)
                A(k)=x3(i,j);
                break;
            end
        end
    end
end
B=reshape(A,m/2,n);
B=B';



%����������Ҿ������������
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

%�ñ���������°�߽�������
A1=zeros(1,N);
for i=1:m
    for j=1:n/2
        for k=1:N
            if k==d(i,j)
                A1(k)=x1(i,j);
                break;
            end
        end
    end
end
B1=reshape(A1,m/2,n);
B1=B1';

X{h}=[B B1];
X{h}=uint8(X{h});
X{h}=X{h}';
     end
Z=cat(3,X{1},X{2},X{3});
else   %��RGBͼ��
    if m>n
    n=m;
    x(m,n)=0;
    N=m*n/2;
    x1=x';
    x2=x1(:,(n/2+1):n);
    x3=x1(:,1:n/2);
    d=zeros(m,n/2);
     if mod(m,2)==1
         m=m+1;
         n=m;
         x(m,n)=0;
         N=m*n/2;
         x1=x';
         x2=x1(:,(n/2+1):n);
         x3=x1(:,1:n/2);
         d=zeros(m,n/2);
     end
 elseif m<n
         m=n;
         x(m,n)=0;
         N=m*n/2;
         x1=x';
         x2=x1(:,(n/2+1):n);
         x3=x1(:,1:n/2);
         d=zeros(m,n/2);
         if mod(n,2)==1
             n=n+1;
             m=n;
             x(m,n)=0;
             N=m*n/2;
             x1=x';
             x2=x1(:,(n/2+1):n);
             x3=x1(:,1:n/2);
             d=zeros(m,n/2);
         end
  elseif m==n
     x1=x';
     x2=x1(:,(n/2+1):n);
     x3=x1(:,1:n/2);
     N=m*n/2;
     d=zeros(m,n/2);
 end
%��־
Flag=zeros(1,N);
Flag1=zeros(1,N);

%���°�߾���ı�������3
y=reshape(x2,1,N);
z=sort(y);
for i=1:m
    for j=1:n/2
        for k=1:N
            if (x2(i,j)==z(1,k)&Flag(1,k)==0)
                d(i,j)=k;
                Flag(1,k)=1;
                break;
            end
        end
    end
end

%�ñ���������ϰ�߽�������
A=zeros(1,N);
for i=1:m
    for j=1:n/2
        for k=1:N
            if k==d(i,j)
                A(k)=x3(i,j);
                break;
            end
        end
    end
end
B=reshape(A,m/2,n);
B=B';



%����������Ҿ������������
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

%�ñ���������°�߽�������
A1=zeros(1,N);
for i=1:m
    for j=1:n/2
        for k=1:N
            if k==d(i,j)
                A1(k)=x1(i,j);
                break;
            end
        end
    end
end
B1=reshape(A1,m/2,n);
B1=B1';

X=[B B1];
X=uint8(X);
X=X';
Z=X;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function Z=zuoyoujiami2(x)

[m n l]=size(x);
if l==3 %RGBͼ��
    %�ж϶���ͼ���Ƿ�Ϊ�����������򲹳ɷ���
    X=cell(1,3);
    for h=1:3
if m>n
    n=m;
    x(m,n,h)=0;
    N=m*n/2;
             x2=x(:,(n/2+1):n,h);  %�Ұ��ͼ��
             x3=x(:,1:n/2,h);     %����ͼ��
              
             d=zeros(m,n/2);
             d1=zeros(m,n/2);    %�����������
             d2=zeros(m,n/2);     %�����������
     if mod(m,2)==1
         m=m+1;
         n=m;
         x(m,n,h)=0;
          
         N=m*n/2;
       
           x2=x(:,(n/2+1):n,h);  %�Ұ��ͼ��
            x3=x(:,1:n/2,h);     %����ͼ��
             
             d=zeros(m,n/2);
              d1=zeros(m,n/2); 
             d2=zeros(m,n/2);   
     end
 elseif m<n
         m=n;
         x(m,n,h)=0;
        
         N=m*n/2;
        
          x2=x(:,(n/2+1):n,h);  %�Ұ��ͼ��
             x3=x(:,1:n/2,h);     %����ͼ��
              
             d=zeros(m,n/2);
              d1=zeros(m,n/2); 
             d2=zeros(m,n/2);   
         if mod(n,2)==1
             n=n+1;
             m=n;
             x(m,n,h)=0;
             N=m*n/2;
             
           x2=x(:,(n/2+1):n,h);  %�Ұ��ͼ��
             x3=x(:,1:n/2,h);     %����ͼ��
             d=zeros(m,n/2);
              d1=zeros(m,n/2); 
             d2=zeros(m,n/2);     
         end
  elseif m==n
     
           x2=x(:,(n/2+1):n,h);  %�Ұ��ͼ��
            x3=x(:,1:n/2,h);     %����ͼ��
             d=zeros(m,n/2);
              d1=zeros(m,n/2); 
             d2=zeros(m,n/2);     
     N=m*n/2;
   
 end
%��־
Flag=zeros(1,N);
Flag1=zeros(1,N);


%���Ұ�߾���ı�������
y=reshape(x2,1,N);
z=sort(y);
for i=1:m
    for j=1:n/2
        for k=1:N
            if (x2(i,j)==z(1,k)&Flag(1,k)==0)
                d(i,j)=k;
                Flag(1,k)=1;
                d1(i,j)=d(i,j);
                break;
            end
        end
    end
end
%�ñ�����������߽�������
A=zeros(1,N);
for i=1:m
    for j=1:n/2
        for k=1:N
            if k==d(i,j)
                A(k)=x3(i,j);
                break;
            end
        end
    end
end
B=reshape(A,n/2,m);
B=B';
%����������Ҿ������������
C=reshape(B,1,N);
z1=sort(C);
for i=1:m
    for j=1:n/2
        for k=1:N
            if (B(i,j)==z1(1,k)&Flag1(1,k)==0)
                d(i,j)=k;
                d2(i,j)=d(i,j);
                Flag1(1,k)=1;
                break;
            end
        end
    end
end
%�ñ���������Ұ�߽�������
A1=zeros(1,N);
for i=1:m
    for j=1:n/2
        for k=1:N
            if k==d(i,j)
                A1(k)=x2(i,j);
                break;
            end
        end
    end
end
B1=reshape(A1,n/2,m);
B1=B1';

X{h}=[B B1];
X{h}=uint8(X{h});
end
Z=cat(3,X{1},X{2},X{3});
    
else  %��rgbͼ��
%�ж϶���ͼ���Ƿ�Ϊ�����������򲹳ɷ���
if  m>n
    n=m;
    x(m,n)=0;
    N=m*n/2;
             x2=x(:,(n/2+1):n);        %�Ұ��ͼ��
             x3=x(:,1:n/2);     %����ͼ��
             d=zeros(m,n/2);
             d1=zeros(m,n/2);    %�����������
             d2=zeros(m,n/2);     %�����������
     if mod(m,2)==1
         m=m+1;
         n=m;
         x(m,n)=0;
         N=m*n/2;
       
            x2=x(:,(n/2+1):n);
             x3=x(:,1:n/2);
             d=zeros(m,n/2);
              d1=zeros(m,n/2); 
             d2=zeros(m,n/2);   
     end
 elseif  m<n
         m=n;
         x(m,n)=0;
         N=m*n/2;
             x2=x(:,(n/2+1):n);
             x3=x(:,1:n/2);
             d=zeros(m,n/2);
              d1=zeros(m,n/2); 
             d2=zeros(m,n/2);   
         if mod(n,2)==1
             n=n+1;
             m=n;
             x(m,n)=0;
             N=m*n/2;
             
             x2=x(:,(n/2+1):n);
             x3=x(:,1:n/2);
             d=zeros(m,n/2);
              d1=zeros(m,n/2); 
             d2=zeros(m,n/2);     
         end
  elseif m==n
     
            x2=x(:,(n/2+1):n);
             x3=x(:,1:n/2);
             d=zeros(m,n/2);
              d1=zeros(m,n/2); 
             d2=zeros(m,n/2);     
     N=m*n/2;
   
 end
%��־
Flag=zeros(1,N);
Flag1=zeros(1,N);

%���Ұ�߾���ı�������
y=reshape(x2,1,N);
z=sort(y);
for i=1:m
    for j=1:n/2
        for k=1:N
            if (x2(i,j)==z(1,k)&Flag(1,k)==0)
                d(i,j)=k;
                Flag(1,k)=1;
                d1(i,j)=d(i,j);
                break;
            end
        end
    end
end
%�ñ�����������߽�������
A=zeros(1,N);
for i=1:m
    for j=1:n/2
        for k=1:N
            if k==d(i,j)
                A(k)=x3(i,j);
                break;
            end
        end
    end
end
B=reshape(A,n/2,m);
B=B';
%����������Ҿ������������
C=reshape(B,1,N);
z1=sort(C);
for i=1:m
    for j=1:n/2
        for k=1:N
            if (B(i,j)==z1(1,k)&Flag1(1,k)==0)
                d(i,j)=k;
                d2(i,j)=d(i,j);
                Flag1(1,k)=1;
                break;
            end
        end
    end
end
%�ñ���������Ұ�߽�������
A1=zeros(1,N);
for i=1:m
    for j=1:n/2
        for k=1:N
            if k==d(i,j)
                A1(k)=x2(i,j);
                break;
            end
        end
    end
end
B1=reshape(A1,n/2,m);
B1=B1';

X=[B B1];
X=uint8(X);
Z=X;
end