% д����˼·Ҫ���������򷽷�Ҫ�ԣ�MATLAB�����ʹ��Ҫ�õ���

% д�ĳ����ڸı����������ֵ���߹�ģʱ������Ӱ�����������������С����磺a�Ĺ�ģ���߳ߴ�m,n�ĸı䡣

% Ҫ�ʵ������־��Ϣλ�������������ȷ��ɡ����磺flag�����롣

a=[10 7 5;1 5 7];

[m,n]=size(a);
tmp=a';
N=m*n;

b=reshape(tmp,1,N);
c=sort(b);

Flag=zeros(1,N);
d=zeros(2,3);

for i=1:m
    for j=1:n
        for k=1:N
            if (a(i,j)==c(1,k) & Flag(1,k)==0)
                d(i,j)=k;
                Flag(1,k)=1;
                break;
            end
        end
    end
end

a
c
d