select=7;                    % ѡ������ͼ��
switch select
    case 1
        I=imread('Watermarked.bmp');
    case 2
        I=imread('gongjihou.bmp');
    case 3                              %������ȡ
        I=imread('secret.png');
    case 4
        I=I1;
    case 5                               %��ͨ��������ȡ
        I=imread('gongjihou.bmp');
    case 6
        I=imread('Watermarked.jpg');
    case 7                                %jpegѹ������ȡ
        I=imread('gongjihou1.jpg');
end
for i=1:u
    for j=1:v
        A1=I(((i-1)*k+1),((j-1)*k+1));
        sy(i,j)=bitand(A1,1);                
    end
end
figure,imshow(logical(sy)),title('Watermark fetched');
imwrite(logical(sy),'FETCHwodeWm.bmp');