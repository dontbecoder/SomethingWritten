%�����ˮӡ------��ȡ����
select=3;                    % ѡ������ͼ��
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
        I=imread('Watermarked.jpg');
    case 7                                %jpegѹ������ȡ
        I=imread('gongjihou1.jpg');
end
% Ii=I(:,:,1);
% Ij=I(:,:,2);
% Ik=I(:,:,3);
% [m,n]=size(Ii);
% I2=double(Ii);
I2=double(I);
sy1=zeros(M,N);

for i=1:M
    for j=1:N
        sy1(i,j)=mod(I2(2*i,2*j),2);
    end
end
   

figure,imshow(logical(sy1)),title('Watermark fetched');
imwrite(logical(sy1),'FETCHwodeWm.bmp');
