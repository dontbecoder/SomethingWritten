function fanzao(filename)   %������
image=imread(filename);
%%%%%%%%%%%%%%%%%%%%%%%�����ܳ�
c=[0 1 0 1];
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Q=cell(1,127);
Q{1}=image;
for k=1:4
    if c(k)==0
        Q{k+1}=shangxiajia(Q{k});
    else
        Q{k+1}=zuoyoujia(Q{k});
    end
end

imwrite(Q{5},'jiamijieguo.tif');
im=imread('jiamijieguo.tif');
imshow(image);
figure,imshow(im)
%shangxia
function Z=shangxiajia(x)
[m n l]=size(x);
if l==3      %RGBͼ��
     %�ж϶���ͼ���Ƿ�Ϊ�����������򲹳ɷ���
     X=cell(1,3);
      for h=1:3
        if m>n
    n=m;
    x(m,n,h)=0;
    N=m*n/2;
    x2=x((m/2+1):m,:,h);%�°��
    x3=x(1:m/2,:,h);  %�ϰ��
    d=zeros(m,n/2);
          if mod(m,2)==1
           m=m+1;
           n=m;
           x(m,n,h)=0;
           N=m*n/2;
           x2=x((m/2+1):m,:,h);%�°��
           x3=x(1:m/2,:,h);  %�ϰ��
           d=zeros(m,n/2);
           end
    elseif m<n
         m=n;
         x(m,n,h)=0;
         N=m*n/2;      
         x2=x((m/2+1):m,:,h);%�°��
         x3=x(1:m/2,:,h);  %�ϰ��
         d=zeros(m,n/2);
         if mod(n,2)==1
             n=n+1;
             m=n;
             x(m,n,h)=0;
             N=m*n/2;
            x2=x((m/2+1:m),:,h);%�°��
            x3=x(1:m/2,:,h);  %�ϰ��
             d=zeros(m,n/2);
         end
      elseif m==n
       x2=x((m/2+1):m,:,h);%�°��
       x3=x(1:m/2,:,h);  %�ϰ��
       N=m*n/2;
       d=zeros(m,n/2);
    end
%��־
Flag=zeros(1,N);
Flag1=zeros(1,N);
%���°�߾���ı�������
y=reshape(x2,1,N);
z=sort(y);
for i=1:m/2
    for j=1:n
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
for i=1:m/2
    for j=1:n
        for k=1:N
            if k==d(i,j)
                A(k)=x3(i,j);
                break;
            end
        end
    end
end
B=reshape(A,n,m/2);
B=B';
%����������Ҿ������������
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
%�ñ���������°�߽�������
A1=zeros(1,N);
for i=1:m/2
    for j=1:n
        for k=1:N
            if k==d(i,j)
                A1(k)=x2(i,j);
                break;
            end
        end
    end
end
B1=reshape(A1,n,m/2);
B1=B1';

X{h}=[B;B1];
X{h}=uint8(X{h});

     end
Z=cat(3,X{1},X{2},X{3});
else 
    %�ж϶���ͼ���Ƿ�Ϊ�����������򲹳ɷ���
if m>n
    n=m;
    x(m,n)=0;
    N=m*n/2;
    x2=x((m/2+1):m,:);        %�°��ͼ��
             x3=x(1:m/2,:);     %�ϰ��ͼ��
             d=zeros(m/2,n);
             d1=zeros(m/2,n);    %�����������
             d2=zeros(m/2,n);     %�����������
     if mod(m,2)==1
         m=m+1;
         n=m;
         x(m,n)=0;
         N=m*n/2;
       
             x2=x((m/2+1):m,:);
             x3=x(1:m/2,:);
             d=zeros(m/2,n);
             d1=zeros(m/2,n);    %�����������
             d2=zeros(m/2,n);     %�����������
     end
 elseif m<n
         m=n;
         x(m,n)=0;
         N=m*n/2;
        
         x2=x((m/2+1):m,:);
             x3=x(1:m/2,:);
             d=zeros(m/2,n);
             d1=zeros(m/2,n);    %�����������
             d2=zeros(m/2,n);     %�����������
         if mod(n,2)==1
             n=n+1;
             m=n;
             x(m,n)=0;
             N=m*n/2;
             
             x2=x((m/2+1):m,:);
             x3=x(1:m/2,:);
             d=zeros(m/2,n);
             d1=zeros(m/2,n);    %�����������
             d2=zeros(m/2,n);     %�����������
         end
  elseif m==n
     
             x2=x((m/2+1):m,:);
             x3=x(1:m/2,:);
             d=zeros(m/2,n);
             d1=zeros(m/2,n);    %�����������
             d2=zeros(m/2,n);     %�����������
     N=m*n/2;
   
 end
%��־
Flag=zeros(1,N);
Flag1=zeros(1,N);

%���°�߾���ı�������
y=reshape(x2,1,N);
z=sort(y);
for i=1:m/2
    for j=1:n
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
%�ñ���������ϰ�߽�������
A=zeros(1,N);
for i=1:m/2
    for j=1:n
        for k=1:N
            if k==d(i,j)
                A(k)=x3(i,j);
                break;
            end
        end
    end
end
B=reshape(A,n,m/2);
B=B';
%����������Ҿ������������
C=reshape(B,1,N);
z1=sort(C);
for i=1:m/2
    for j=1:n
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
%�ñ���������°�߽�������
A1=zeros(1,N);
for i=1:m/2
    for j=1:n
        for k=1:N
            if k==d(i,j)
                A1(k)=x2(i,j);
                break;
            end
        end
    end
end
B1=reshape(A1,n,m/2);
B1=B1';
X=[B;B1];
X=uint8(X);
Z=X;
end
%zuoyou 
function Z=zuoyoujia(x)
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

    
else   %��rgbͼ��
%�ж϶���ͼ���Ƿ�Ϊ�����������򲹳ɷ���
if m>n
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
 elseif m<n
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