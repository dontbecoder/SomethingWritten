
clc;                               % 初始化
clear;
close all;

I=rgb2gray(imread('len1.jpg'));      % 读入原始图像
figure,imshow(I);
[C,S]=wavedec2(I,2,'haar');        % 尺度为2的小波分解
cA2=appcoef2(C,S,'haar',2);        % 提取cA2分量
[m,n]=size(cA2);                   % 提取cA2分量尺寸
Num=uint32(m*n);

% ca2=floor(cA2);
% xspj=sum(sum(cA2-ca2))/m/n;        % 计算小波系数小数部分的平均值xspj

cA2x=cA2;                          % 修改cA2系数

xgxs=reshape(cA2x,1,m*n);          % 将修改过的cA2系数重新组织成以列为主序的形式
C(1,1:Num)=xgxs;                   % 将修改过的cA2系数添加到小波分解系数中去
I1=waverec2(C,S,'haar');           % 2维小波合成图像

TI=uint8(round(I1));
figure,imshow(TI);                 % 显示合成的图像
imwrite(TI,'watermarked.bmp');     % 存储载体图像