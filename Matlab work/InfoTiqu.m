select=1;                    % ѡ������ͼ��
switch select
    case 1
        I=imread('secret.bmp');
    case 2
        I=imread('secret.jpg');
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
Ii=I(:,:,1);
Ij=I(:,:,2);
Ik=I(:,:,3);

INFO=bitand(Ik,15);           %��ȡ��4λ��Ϣ
INFOB=bitshift(INFO,4); 

INFOA=bitand(Ij,15);
Information=bitor(INFOB,INFOA);

imshow(I),title('��������Ϣͼ��');
figure,imshow(Information),title('������Ϣ');