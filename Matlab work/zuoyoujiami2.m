function X=zuoyoujiami2(x)
[m n]=size(x);
%�ж϶���ͼ���Ƿ�Ϊ�����������򲹳ɷ���
if m>n                  %�����������������
    n=m;
    x(m,n)=0;           %���ɷ���
    N=m*n/2;
    x2=x(:,(n/2+1):n);
    x3=x(:,1:n/2);
    d=zeros(m,n/2);     %���������Ҿ���
     if mod(m,2)==1     %�����������е����
         m=m+1;
         n=m;
         x(m,n)=0;
         N=m*n/2;
         x2=x(:,(n/2+1):n);
         x3=x(:,1:n/2);
         d=zeros(m,n/2);
     end
 elseif m<n             %����С������
         m=n;
         x(m,n)=0;
         N=m*n/2;
         x2=x(:,(n/2+1):n);
         x3=x(:,1:n/2);
         d=zeros(m,n/2);
         if mod(n,2)==1    %�����������е����
             n=n+1;
             m=n;
             x(m,n)=0;
             N=m*n/2;
             x2=x(:,(n/2+1):n);
             x3=x(:,1:n/2);
             d=zeros(m,n/2);
         end
  elseif m==n             %������ȵ����
     x2=x(:,(n/2+1):n);
     x3=x(:,1:n/2);
     N=m*n/2;
     d=zeros(m,n/2);
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

%�ñ���������Ұ�߽�������
A1=zeros(1,N);
for i=1:m
    for j=1:n/2
        for k=1:N
            if k==d(i,j)
                A1(k)=x(i,j);
                break;
            end
        end
    end
end
B1=reshape(A1,m/2,n);
B1=B1';

X=[B B1];
X=uint8(X);