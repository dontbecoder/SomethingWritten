clc;
clear;
%X=imread('Watermarked.bmp');  %����ǰͼ��
X=imread('len.bmp');  %����ǰͼ��

 select=1;                    %ѡ�񹥻���ͼ�� 
 switch select
    case 1
        Y=imread('gongjihou.bmp'); 
    case 2
        Y=imread('gongjihou1.jpg');
end
 
[m,n]=size(X);
X1=zeros(2,2);
Y1=zeros(2,2);
x=0;%���ؼ��ٵĸ���
y=0;%�������ӵĸ���
i=1;
Z=zeros(1,m*n/4); %���ر仯ֵ

for p=1:m/2
      for q=1:n/2
           X1=X(1+(2*(p-1)):2*p,1+(2*(q-1)):2*q);     % ��ȡ����ǰͼ��2*2��
           Y1=Y(1+(2*(p-1)):2*p,1+(2*(q-1)):2*q);     % ��ȡ������ͼ��2*2�� 
           if sum(sum(X1))-sum(sum(Y1))>0
               x=x+1;
           else if sum(sum(X1))-sum(sum(Y1))<0
               y=y+1;    
       end
   end
       q=q+1;
   end
       p=p+1;
end
  x
  y
  m*n
  x/(x+y)
  y/(x+y)