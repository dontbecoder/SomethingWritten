x=imread('cameraman.tif');
[m n]=size(x);
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

imwrite(X,'zuoyoujiami.tif')
im=imread('zuoyoujiami.tif');
imshow(im)
%�����Ұ��
B1=B1';
L=reshape(B1,1,N);
 for k=1:N
    for i=1:m
         for j=1:n/2
        
            if k==d2(i,j)
                d2(i,j)=L(k);
                break;
            end
        end
    end
end
%���������
B=B';
L1=reshape(B,1,N);
 for k=1:N
    for i=1:m
        for j=1:n/2
       
            if k==d1(i,j)
                d1(i,j)=L1(k);
                break;
            end
        end
    end
end

Y=[d1 d2];
Y=uint8(Y);
imwrite(Y,'zuoyoujie.tif');
im=imread('zuoyoujie.tif');
figure,imshow(im)