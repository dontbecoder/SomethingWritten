function C=gzigzag(B)

%    ����֮�����ͻ�ԭһ�����󣨷Ƕ����棩

[M,N]=size(B);
m=sqrt(N);
AZIGZAG=gzigzag(m);
for i=1:m
    for j=1:m
        for k=1:N
            if k==AZIGZAG(i,j)
             C(i,j)=B(k);
            end
        end
    end
end

