function fanzao(filename)   %������
image=imread(filename);
start_time=cputime;
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
        Q{k+1}=shangxiajia(Q{k});
    else
        Q{k+1}=zuoyoujia(Q{k});
    end
end
elapsed_time=cputime-start_time
imwrite(Q{4},'jiamijieguo.tif');
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
 i=1:m/2;
     j=1:n;
      [I,J]=meshgrid(i,j);
     for k=1:N;
               if (x2(I,J)==z(1,k)&Flag(1,k)==0)
                d(I,J)=k;
                Flag(1,k)=1;
                break;
            end
        end
   

%�ñ���������ϰ�߽�������
A=zeros(1,N);
 for i=1:m/2;
    for j=1:n;
  
        for k=1:N;
       
            if k==d(I,J)
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
 i=1:m/2;
     j=1:n;
     [I,J]=meshgrid(i,j);
      for k=1:N
            if (B(I,J)==z1(1,k)&Flag1(1,k)==0)
                d(I,J)=k;
                Flag1(1,k)=1;
                break;
            end
        end
   

%�ñ���������°�߽�������
A1=zeros(1,N);
 i=1:m/2;
     j=1:n;
     [I,J]=meshgrid(i,j);
        for k=1:N
            if k==d(I,J)
                A1(k)=x2(I,J);
                break;
            end
        end
    

B1=reshape(A1,n,m/2);
B1=B1';

X{h}=[B;B1];
X{h}=uint8(X{h});

     end
Z=cat(3,X{1},X{2},X{3});
else 
    R=islogical(x);
    if R==0    %�Ҷ�ͼ��
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
 i=1:m/2;
     j=1:n;
     [I,J]=meshgrid(i,j);
        for k=1:N
            if (x2(I,J)==z(1,k)&Flag(1,k)==0)
                d(I,J)=k;
                Flag(1,k)=1;
                d1(I,J)=d(I,J);
                break;
            end
        end
    

%�ñ���������ϰ�߽�������
A=zeros(1,N);
 i=1:m/2;
     j=1:n;
     [I,J]=meshgrid(i,j);
        for k=1:N
            if k==d(I,J)
                A(k)=x3(I,J);
                break;
            end
        end
   
B=reshape(A,n,m/2);
B=B';
%����������Ҿ������������
C=reshape(B,1,N);
z1=sort(C);
 i=1:m/2;
     j=1:n;
     [I,J]=meshgrid(i,j);
        for k=1:N
            if (B(I,J)==z1(1,k)&Flag1(1,k)==0)
                d(I,J)=k;
                d2(I,J)=d(I,J);
                Flag1(1,k)=1;
                break;
            end
        end


%�ñ���������°�߽�������
A1=zeros(1,N);
 i=1:m/2;
     j=1:n;
     [I,J]=meshgrid(i,j);
        for k=1:N
            if k==d(I,J)
                A1(k)=x2(I,J);
                break;
            end
        end

B1=reshape(A1,n,m/2);
B1=B1';
X=[B;B1];
X=uint8(X);
Z=X;
    else   %��ֵͼ��
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
 i=1:m/2;
     j=1:n;
     [I,J]=meshgrid(i,j);
        for k=1:N
            if (x2(I,J)==z(1,k)&Flag(1,k)==0)
                d(I,J)=k;
                Flag(1,k)=1;
                d1(I,J)=d(I,J);
                break;
            end
        end
   
%�ñ���������ϰ�߽�������
A=zeros(1,N);
 i=1:m/2;
     j=1:n;
     [I,J]=meshgrid(i,j);
        for k=1:N
            if k==d(I,J)
                A(k)=x3(I,J);
                break;
            end
        end
   
B=reshape(A,n,m/2);
B=B';
%����������Ҿ������������
C=reshape(B,1,N);
z1=sort(C);
 i=1:m/2;
     j=1:n;
     [I,J]=meshgrid(i,j);
        for k=1:N
            if (B(I,J)==z1(1,k)&Flag1(1,k)==0)
                d(I,J)=k;
                d2(I,J)=d(I,J);
                Flag1(1,k)=1;
                break;
            end
        end
    
%�ñ���������°�߽�������
A1=zeros(1,N);
 i=1:m/2;
     j=1:n;
     [I,J]=meshgrid(i,j);
        for k=1:N
            if k==d(I,J)
                A1(k)=x2(I,J);
                break;
            end
        end
    
B1=reshape(A1,n,m/2);
B1=B1';
X=[B;B1];
X=logical(X);
Z=X;
    end
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
    R=islogical(x);
    if R==0    %�Ҷ�ͼ��
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
else   %��ֵͼ��
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
X=logical(X);
Z=X;
end
end