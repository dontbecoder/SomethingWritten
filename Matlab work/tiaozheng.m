function x=tiaozheng(y)   %������任ϵ������

[m,n]=size(y);
x=zeros(m,n);
x1=zeros(m,n);
 
x=fix(y);       %����y����������
x1=y-fix(y);     %����y��С������
s=sum(sum(x1));  %����yС�����ֺ�

re=reshape(x1,1,m*n); %ʵ��Ϊ����y��С������Ԫ��
im=(1:m*n);           %�鲿ΪԪ�ص�λ�� 
x2=re+i*im;   %������������
x3=Esort(x2);   %��ʵ����x3��������
for k=1:m*n
    if s>=0.5 & x(imag(x3(k)))<=255 %����ֵ������255
        x(imag(x3(k)))=x(imag(x3(k)))+1;
        k=k+1;
        s=s-1;
    end
end
%x      
%s