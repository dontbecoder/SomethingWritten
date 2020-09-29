f=imread('f.bmp')
PQ=paddedsize(size(f));
[U,V]=dftuv(PQ(1),PQ(2));
D0=0.05*PQ(2);                                  %��ֹ����
F=fft2(f,PQ(1),PQ(2));
H=exp(-(U.^2+V.^2)/(2*(D0^2)));                 %��˹��ͨ�˲�(GLPF)���ݺ��� 
g=dftfilt(f,H);
figure,imshow(f,[])
figure,imshow(fftshift(H),[])                   %ͼ����ʽ�쿴�˲���
figure,imshow(log(1+abs(fftshift(F))),[])       %Ƶ����ʾ
figure,imshow(g,[])                             %������ͼ��