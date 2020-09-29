%���������Ӿ��İ���ˮӡ
clear
close all
tm=cputime;
image=imread('cameraman.tif');  %ԭʼͼ��
shuiyin=imread('logo.tif');     %��Ƕ�����Ϣ
[x y]=size(shuiyin);
shuiyin1=reshape(shuiyin,1,x*y);

[m n l]=size(image);
blocksize=m*n/64;             %��8*8����
blocksize1=sqrt(blocksize);   %ÿ�У��У��Ŀ���


fi=10;              
B=zeros(1,blocksize);%����ϵ��
T=zeros(1,blocksize);%����ϵ��
Sita=zeros(1,blocksize);%����ϵ��
Deta=zeros(1,blocksize);%��������
cA1=cell(1,blocksize);%LLϵ��
A=cell(1,blocksize);%LLϵ�����У�
cH1=cell(1,blocksize);%LHϵ��
cV1=cell(1,blocksize);%HLϵ��
cD1=cell(1,blocksize);%HHϵ��
Q=cell(1,blocksize);%�������
tmp=cell(1,blocksize);%8*8����
tmp1=cell(1,blocksize);%Ƕ����8*8����

%%%%%%%%%%%%%%%%%%�ֿ�
 k=1; %���ֵ��k=1������1��8&8��
   for i=1:blocksize1
    for j=1:blocksize1
       
        tmp{k}=image(((i-1)*8+1):(i*8),((j-1)*8+1):(j*8));%��ÿһ��8*8��
        [cA,cH,cV,cD]=dwt2(tmp{k},'haar');
      
        cA1{k}=cA;%��¼ϵ��
        cH1{k}=cH;
        cV1{k}=cV;
        cD1{k}=cD;
        A{k}=reshape(cA1{k},1,16);
        B(k)=sum((sum(cA1{k}))/8160); %������ϵ��
        T(k)=(sum(sum(abs(cH1{k})))+sum(sum(abs(cV1{k})))+sum(sum(abs(cD1{k}))))/2100;%������ϵ��
        
        ch{k}=reshape(cH1{k},1,16);
        cv{k}=reshape(cV1{k},1,16);
        cd{k}=reshape(cD1{k},1,16);
        Sita(k)=(var(ch{k})+var(cv{k})+var(cd{k}))/3;%�󷽲�ϵ��
        if Sita(k)==0
            Deta(k)==1
        else
        Deta(k)=fi*B(k)*T(k)*Sita(k);%��������
        end
       Q{k}=floor(A{k}/Deta(k));%����
    k=k+1;
  end
end


%%%%%%%%%%%%%%%ˮӡǶ��
k=1;
            for i=1:16     %ÿ��LL��16��ϵ��
            
                  if mod(Q{k}(i),2)==shuiyin1(16*(k-1)+i)                           %��������ˮӡ�����Ǻϵ����
                         if A{k}(i)>=0                                        
                          A{k}(i)=Q{k}(i)*Deta(k)+Deta(k)/2;
                          else
                          A{k}(i)=Q{k}(i)*Deta(k)-Deta(k)/2;
                          end
                  else                                                      %��������ˮӡ���ݲ��Ǻϵ����
                        if A{k}(i)>=0
                               if rem(A{k}(i),Deta(k))>=Deta(k)/2
                                  A{k}(i)=(Q{k}(i)+1)*Deta(k)+Deta(k)/2;
                               elseif rem(A{k}(i),Deta(k))<Deta(k)/2
                                  A{k}(i)=(Q{k}(i)-1)*Deta(k)+Deta(k)/2;
                               end
                        else
                               if abs(rem(A{k}(i),Deta(k))>=Deta(k)/2)
                                  A{k}(i)=(Q{k}(i)-1)*Deta(k)-Deta(k)/2;
                               elseif abs(rem(A{k}(i),Deta(k))<Deta(k)/2)
                                  A{k}(i)=(Q{k}(i)+1)*Deta(k)-Deta(k)/2;
                               end
                        end 
                  end
                  cA1{k}=reshape(A{k},4,4);
                k=k+1;
             
         end 
      
%IDWT 
for k=1:blocksize
tmp1{k}=idwt2(cA1{k},cH1{k},cV1{k},cD1{k},'haar');
end

%�ع�ͼ��
WM=zeros(m,n);%�溬ˮӡ��ͼƬ
k=1;
    for i=1:blocksize1
    for j=1:blocksize1
        WM(((i-1)*8+1):(i*8),((j-1)*8+1):(j*8))=tmp1{k};
    k=k+1;   
    end
    end
WM=uint8(WM);
figure(1),imshow(image)
title('Original Image')
figure(2),imshow(shuiyin)
title('copy_right')
imwrite(WM,'Watermarked.tif');
wm=imread('Watermarked.tif');
figure(3),imshow(wm)
title('Watermarked Image')
time=cputime-tm