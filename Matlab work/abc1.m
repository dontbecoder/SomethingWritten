a=zeros(1,128);
b=[1 1 0 0 1 1 0 0];                          %  L F S R ��ʼֵ11001100
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