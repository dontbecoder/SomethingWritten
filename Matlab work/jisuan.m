Sy=imread('sy.bmp');           % ��Ƕ���ˮӡ��Ϣ
Sy1=imread('sy1.bmp');           % �۸ĵ�ˮӡ��Ϣ
[m,n]=size(Sy);                
pic=1;                         % ѡ��ԭʼͼ�����Ĵ�С
switch pic
    case 1
        kx=256;
        ky=256;      
end
rx=kx/2;                       % rx*ry С��ϵ����ģ
ry=ky/2;
B=(sum(sum(xor(Sy,Sy1))))/(rx*ry);    
B
    