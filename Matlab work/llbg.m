% �˲��� 
% fspecial('type',parameters)
% 'type' �˲������� 'parameters'��һ�������ƶ����˲���
% ��˹��ͨ�˲��� fspecial('gaussian',[r,c],sig).
% һ����СΪr*c�ĸ�˹��ͨ�˲�������׼ƫ��Ϊsig(��)��Ĭ��ֵΪ3*3��0.5������һ����������[r,c],���ʾ�����˲�����
f=imread('f.bmp');
w=fspecial('gaussian');
g=imfilter(f,w,'replicate');   
% �߽�ѡ�� 
% 'replicate'ͼ�δ�Сͨ�����Ʊ߽��ֵ����չ��
% 'symmetric'ͼ�δ�Сͨ����������߽�����չ��
% 'circular' ͼ�δ�Сͨ����ͼ�񿴳�һ����ά���ں�����һ����������չ��
% P          ����ͼ��ı߽�ͨ����ֵP(������)�������չ��P��Ĭ��ֵΪ0��
figure,imshow(f,[]);
figure,imshow(g,[]);