
clc;                               % ��ʼ��
clear;
close all;

I=rgb2gray(imread('len1.jpg'));      % ����ԭʼͼ��
figure,imshow(I);
[C,S]=wavedec2(I,2,'haar');        % �߶�Ϊ2��С���ֽ�
cA2=appcoef2(C,S,'haar',2);        % ��ȡcA2����
[m,n]=size(cA2);                   % ��ȡcA2�����ߴ�
Num=uint32(m*n);

% ca2=floor(cA2);
% xspj=sum(sum(cA2-ca2))/m/n;        % ����С��ϵ��С�����ֵ�ƽ��ֵxspj

cA2x=cA2;                          % �޸�cA2ϵ��

xgxs=reshape(cA2x,1,m*n);          % ���޸Ĺ���cA2ϵ��������֯������Ϊ�������ʽ
C(1,1:Num)=xgxs;                   % ���޸Ĺ���cA2ϵ����ӵ�С���ֽ�ϵ����ȥ
I1=waverec2(C,S,'haar');           % 2άС���ϳ�ͼ��

TI=uint8(round(I1));
figure,imshow(TI);                 % ��ʾ�ϳɵ�ͼ��
imwrite(TI,'watermarked.bmp');     % �洢����ͼ��