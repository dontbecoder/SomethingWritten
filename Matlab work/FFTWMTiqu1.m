%    FFTˮӡ��ȡ
select=3;                       % ѡ������ͼ��
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
        I=imread('gongjihou2.jpg');
end
% [m,n]=size(I);
sy=zeros(u,v);
for i=1:u
    for j=1:v
        A1=I(((i-1)*2+1):(i*2),((j-1)*2+1):(j*2));                                              % ��ȡͼ���
        B2=fft2(A1);
%         B21=fftshift(B2);
        Lh11=floor(B2(1)/Deta);
        sy(i,j)=mod(Lh11,2);   
        
    end
end
%    sy=~sy;
figure,imshow(logical(sy)),title('Watermark fetched');
imwrite(logical(sy),'FETCHwodeWm.bmp');
