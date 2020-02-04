clear;
Q1=0.25;Q=12.6;N=8;%ָ������ϵ��Q1,Q,ͼ��ֿ��СֵN
j=0;k=0;%��ʼ��
Inputf=input('input the images name:','s');%�������ı��ַ���
Inputf=imread(Inputf);
if isrgb(Inputf)
    Inputf=rgb2gray(Inputf);%rgbͼ��ת��Ϊ�Ҷ�ͼ��
end
if isgray(Inputf)
    Input=double(Inputf);
    [a,b]=size(Inputf);
end
subplot 221;imshow(Inputf,[]);title('ԭʼͼ��');

blockno1=fix(a/N);blockno2=fix(b/N);%���㷽��ȡ��
w=zeros(blockno1,blockno2);
for j=1:blockno1
   for k=1:blockno2
       x=(j-1)*N+1;    
      y=(k-1)*N+1;
      block_dct1=Input(x:x+N-1,y:y+N-1);
      LINE=zeros(1,64);
for i=1:8
    LINE=[LINE,double(block_dct1(i,:))];
end
LINE=LINE(65:128);
std1=std(LINE);%ɾ��ǰ64����
std1=fix(std1/Q1)*Q1;%����ѡ�ӿ�ı�׼����й�һ������
%Logistic����ӳ��
n=10;z=zeros(1:n+1);z(1)=std1;
for i=1:n
    z(i+1)=1-2*(z(i)^2);
end
if z(n+1)<=0 w(j,k)=0;
elseif z(n+1)>0 w(j,k)=1;   %����ˮӡ����
end
%�����ڽ�ֵ�㷨˼�뽫w(j,k)������Ƕ�뼼��Ƕ��DCT��ֱ��ϵ��A(0,0)��block_dct1(1,1);
block_dct1=dct2(block_dct1);h=round(block_dct1(1,1)/Q);
 if w(j,k)==0     
        if rem(h,2)==0 %������ż��
            block_dct1(1,1)=h*Q;
        elseif rem(h,2)==1   %����
            if block_dct1(1,1)-h*Q>0 block_dct1(1,1)=(h+1)*Q;
            else block_dct1(1,1)=(h-1)*Q;
            end
        end    
 elseif w(j,k)==1
     if    rem(h,2)==1    %����������
         block_dct1(1,1)=h*Q;
     elseif rem(h,2)==0   %ż��
         if block_dct1(1,1)-h*Q>0  block_dct1(1,1)=(h+1)*Q;
         else block_dct1(1,1)=(h-1)*Q;
         end
     end
 end
 block_dct2=idct2(block_dct1);%ͼ���ӿ�����DCT�任,�õ�����ˮӡ��ͼ���ӿ�
   Outf(x:x+N-1,y:y+N-1)=block_dct2;
   end
end
subplot 222;imshow(Outf,[]);
title('�����ͼ��');


         
        
     
   






      
      
       








