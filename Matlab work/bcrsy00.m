%基于人眼视觉的半弱水印--水印提取
time0=cputime;
I=zeros(m,n);
turnkey=3;
switch turnkey
    case 1
        I=round(TI);
    case 2
        I=TI;
    case 3
        I=imread('watermarked.bmp');
    otherwise
        I=I1;
end

[m,n]=size(I);

                        
switch pic                    % kx*ky 截取图像规模
    case 1
        kx=256;
        ky=256;
    case 2
        kx=128;
        ky=128;
    case 3
        kx=64;
        ky=64;
    case 4
        kx=32;
        ky=32;
    case 5
        kx=16;
        ky=16;
    case 6
        kx=8;
        ky=8;
end
rx=kx/2;                       % rx*ry 小波系数规模
ry=ky/2;
M=m/kx;                         % 行中块数
N=n/ky;                         % 列中块数
Numbers=M*N;                   % 总8*8块数

sy=zeros(m/2,n/2);
B=zeros(1,Numbers);            % 亮度系数
T=zeros(1,Numbers);            % 纹理系数
Sita=zeros(1,Numbers);         % 方差系数
Deta=zeros(1,Numbers);         % 量化步长
%pic=4;
switch pic
    case 1
        MAXb=8160*1024;
        MAXt=2100*1024;
    case 2
        MAXb=8160*256;
        MAXt=2100*256;
    case 3
        MAXb=8160*64;
        MAXt=2100*64;
    case 4
        MAXb=8160*16;
        MAXt=2100*16;
    case 5
        MAXb=8160*4;
        MAXt=2100*4;
    case 6
        MAXb=8160;
        MAXt=2100;
end
cA1=zeros(rx,ry);              % LL系数
cH1=zeros(rx,ry);              % LH系数
cV1=zeros(rx,ry);              % HL系数
cD1=zeros(rx,ry);              % HH系数

Dt=1;                          % 量化步长
Q=zeros(rx,ry);                % 量化值
S=zeros(rx,ry);                % 调整后的cA1系数

% 分块
tmp=zeros(kx,ky);              % 原始图像截取的8X8块
tmp1=zeros(kx,ky);             % 载体合成块8X8
Tmp=zeros(rx,ry);              % 截取的水印块4X4
k=1;                           % 块初值，k=1表明第1个8X8块
for i=1:M
    for j=1:N
               
        tmp=I(((i-1)*kx+1):(i*kx),((j-1)*ky+1):(j*ky));                                              % 截取图像块
        [cA1,cH1,cV1,cD1]=dwt2(tmp,'haar');                                                          % haar小波变换
        
        B(1,k)=sum(sum(cA1))/MAXb;                                                                   % 亮度系数
        T(1,k)=(sum(sum(abs(cH1)))+sum(sum(abs(cV1)))+sum(sum(abs(cD1))))/MAXt;                      % 纹理系数
        Sita(1,k)=(std(reshape(cH1,rx*ry,1))+std(reshape(cV1,rx*ry,1))+std(reshape(cD1,rx*ry,1)))/3; % 方差系数
        Deta(1,k)=B(1,k)*T(1,k)*Sita(1,k)*fi;                                                        % 量化步长

        if Deta(1,k)<=2                                                                              % 量化步长调整方案一
            Deta(1,k)=1;
        else
            Deta(1,k)=1+log(Deta(1,k));                                                              % 采用log量化步长合适
        end
        Deta(1,k)=round(2*Deta(1,k));                                                                % Deta 计算方法二 
        if mod(Deta(1,k),2)==1
            Deta(1,k)=Deta(1,k)+1;
        end
        
        Q=floor(cA1/Deta(1,k));                                                                      % 量化LL系数
        Tmp=mod(Q,2);
        sy(((i-1)*rx+1):(i*rx),((j-1)*ry+1):(j*ry))=Tmp;
 
%         if k==436                                                                                  % 输出定点计算的参数                                     
%             clc
%             tmp
%             Tmp
%             B(1,k)
%             T(1,k)
%             Sita(1,k)
%             Deta(1,k)
%             pause
%         end
        
        k=k+1;                                                                                       % 处理下一个图像块
    end
end

figure,imshow(sy),title('Watermark fetched');
imwrite(sy,'Watermarkfetched.bmp');
DetaSave1=Deta;
time1=cputime-time0
figure;
switch pic
    case 1
        subplot(2,2,1),plot (B(1,1:1024), 'DisplayName', 'B(1,1:1024)', 'YDataSource', 'B(1,1:1024)'); 
        subplot(2,2,2),plot (T(1,1:1024), 'DisplayName', 'T(1,1:1024)', 'YDataSource', 'T(1,1:1024)'); 
        subplot(2,2,3),plot (Sita(1,1:1024), 'DisplayName', 'Sita(1,1:1024)', 'YDataSource', 'Sita(1,1:1024)'); 
        subplot(2,2,4),plot (Deta(1,1:1024), 'DisplayName', 'Deta(1,1:1024)', 'YDataSource', 'Deta(1,1:1024)'); 
    case 2
        subplot(2,2,1),plot (B(1,1:1), 'DisplayName', 'B(1,1:1)', 'YDataSource', 'B(1,1:1)'); 
        subplot(2,2,2),plot (T(1,1:1), 'DisplayName', 'T(1,1:1)', 'YDataSource', 'T(1,1:1)'); 
        subplot(2,2,3),plot (Sita(1,1:1), 'DisplayName', 'Sita(1,1:1)', 'YDataSource', 'Sita(1,1:1)'); 
        subplot(2,2,4),plot (Deta(1,1:1), 'DisplayName', 'Deta(1,1:1)', 'YDataSource', 'Deta(1,1:1)'); 
end

%DetaSave1=Deta;

% End on 2006-08-18-12:13