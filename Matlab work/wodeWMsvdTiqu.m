%    SVDˮӡ��ȡ
select=3;                     % ѡ������ͼ��
switch select
    case 1
        I=round(I1);
    case 2
        I=TI;
    case 3                              %������ȡ
        I=imread('Watermarked.bmp');
    case 4
        I=I1;
    case 5                               %��ͨ��������ȡ
        I=imread('gongjihou.bmp');
    case 6
        I=imread('watermarked.jpg');
    case 7                                %jpegѹ������ȡ
        I=imread('gongjihou1.jpg');
end
[m,n]=size(I);
sy=zeros(u,v);
for i=1:u
    for j=1:v
        B=I(((i-1)*2+1):(i*2),((j-1)*2+1):(j*2));                                              % ��ȡͼ���
        [U,S,V]=svd(double(B));
         s=max(max(S));
        [x y]=find(S==s);
        S(x(1),y(1))=floor(S(x(1),y(1))/Deta);
        sy(i,j)=mod(S(x(1),y(1)),2);
    end
end
   
figure,imshow(logical(sy)),title('Watermark fetched');
imwrite(logical(sy),'FETCHwodeWm.bmp');
