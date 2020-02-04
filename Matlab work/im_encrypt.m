function   im_encrypt(filename,passwd,u)
% ��    �ܣ� ��RGBͼ����м��ܻ����
% ���ø�ʽ�� im_encrypt(filename,passwd,u)
% ����˵���� filename -- ���С�ͼ���ļ������ơ����ͺ�·�������ַ���
%            passwd   -- (0,1)֮�������С������Ϊͼ��Ľ������룬Ĭ��ֵΪ0.1����ʼ�����㣩
%            u        -- Logistic���̲���[3.57,4.0],Ĭ��ֵΪ3.9843
% �� �� ֵ�� �޷���ֵ
% ʾ    ���� 1.>> im_encrypt('c:\angle.bmp',0.222��3.9)
%                ������ C ���µ�λͼ angle ���м��ܣ���������Ϊ0.222
%            1.>> im_encrypt('c:\angle.bmp')
%                ������ C ���µ�λͼ angle ���м��ܣ���������ΪĬ��ֵ0.1

% �������Ĳ����Ƿ��д�
if nargin==0 | nargin>3                                      % �����������
    error('����Ĳ���������Ҫ��"����help im_encrypt"�ɵõ�������');
end
if nargin==3 & (ischar(filename)==0 | isa(passwd,'double')==0 | isa(u,'double')==0 | passwd>=1 | passwd<=0 | u<3.5715 | u>4.0) % �� im_encrypt(filename,passwd) ����ʽ����ʱ
    error('����Ĳ���������Ҫ��"����help im_encrypt"�ɵõ�������');
end
if nargin==2 & (ischar(filename)==0 | isa(passwd,'double')==0 | passwd>=1 | passwd<=0)% �� im_encrypt(filename,passwd) ����ʽ����ʱ
    error('����Ĳ���������Ҫ��"����help im_encrypt"�ɵõ�������');
end
if nargin==1 & ischar(filename)==0                            % �� im_encrypt(filename) ����ʽ����ʱ
    error('����Ĳ���������Ҫ��"����help im_encrypt"�ɵõ�������');
end
if nargin==1
    passwd=0.1;
    u=3.9843;
end
if nargin==2
    u=3.9843;
end

% ��ͼ���ļ�
image=imread(filename);
figure,imshow(image);

% ��ͼ����м��ܲ�����BEncrypt='true'��
imsize=size(image);
temp=size(imsize);
im_dim=temp(2);             % ͼ���ά��
count=imsize(1)*imsize(2);  % ���ظ���
times=1;      % ������
for i=1:imsize(1)           % ��ͼ���ÿһ��
    for j=1:imsize(2)       % ��ͼ���ÿһ��
        % ��Logistic���������������� y(i)
        if(times==1)         % �Ե�һ�����ؽ��м���,��һ�ν���Logistic����
                                    % Logistic���� ��Ϊʲôû������Ϊһ�������ļ���д��ԭ����ѭ�������϶��ѭ�����У����˵��ú����ļ����ǳ�������       
                                    for k=1:1000
                                        x(i)=0;
                                    end
                                    x(1)=passwd;
                                    for k=2:1000
                                         x(k)=u*x(k-1)*(1-x(k-1));
                                    end
                                    y(1)=x(1000);
        else                 % �ǵ�һ��Logistic���������������ؼ���
                                    % Logistic����
                                    x(1)=y(times-1);    % ��һ�ε������յ���Ϊ���ε��������
                                    for k=2:9
                                        x(k)=u*x(k-1)*(1-x(k-1));
                                    end
                                    y(times)=x(9);
        end
        
        % ��y(i)����255����ת���ɶ�����
        binary_yi=dec_to_bin(y(times)*255);
        
        if im_dim==2                        % ����256ɫ�Ҷ�ͼ��
            % ���Ҷ�ֵ����ת���ɶ�����
            binary_p_ming=dec_to_bin(image(i,j));
            % ��binary_p_ming��binary_yi����������㣬�õ����ص�ĻҶ�ֵ�Ķ���������
            binary_p_ma=m_xor(binary_p_ming,binary_yi);
            % ���Ҷ�ֵ�Ķ���������ת����ʮ���ƣ����������ص�
            image(i,j)=bin_to_dec(binary_p_ma);
        else                                % ����RGBͼ��
            % �����ص��RGBֵ����ת���ɶ�����
            binary_R_ming=dec_to_bin(image(i,j,1));
            binary_G_ming=dec_to_bin(image(i,j,2));
            binary_B_ming=dec_to_bin(image(i,j,3));
            % ��binary_yi�ֱ���binary_R_ming��binary_G_ming��binary_B_ming����������㣬�õ����ص��RGBֵ����
            binary_R_ma=m_xor(binary_yi,binary_R_ming);
            binary_G_ma=m_xor(binary_yi,binary_G_ming);
            binary_B_ma=m_xor(binary_yi,binary_B_ming);
            % ���ص��RGBֵ����ת����ʮ���ƣ����������ص�
            image(i,j,1)=bin_to_dec(binary_R_ma);
            image(i,j,2)=bin_to_dec(binary_G_ma);
            image(i,j,3)=bin_to_dec(binary_B_ma);
        end
        
        % �����ص�ļ��ܵ�����ɣ���ʾ����
        if times==i*imsize(2)  % ������һ��
            imshow(image); 
        end
        
        % ������һ�����ص�
        times=times+1;
    end
end

% ����ͼ��
imwrite(image,filename);
im=imread(filename);
imshow(im);

function ret_str=m_xor(str1,str2)
% ��    �ܣ� �������
% ���÷�ʽ�� m_xor(str1,str2)
% ����˵���� str1,str2��Ϊ8λ�ַ���
% ʾ    ���� str1='10011001'
%            str2='01010001'
%            m_xor(str1,str2)='11001000'

ret_str='00000000';
for i=1:8
    if str1(i)==str2(i)
        ret_str(i)='0';
    else
        ret_str(i)='1';
    end
end

function ret=bin_to_dec(bin)
% ��    �ܣ� ��8λ�����ƴ�ת����0~255֮�������
% ���÷�ʽ�� d=bin_to_dec(bin)
% ����˵���� bin -- 8λ�����ƴ�
% �� �� ֵ�� 0~255֮�������
% ʾ    ���� d=dec_to_bin('11001000')
%               =200
if ischar(bin)==0 | size(bin)>8 | size(bin)<8
    error('�����д�');
end
ret=bin2dec(bin);

function ret=dec_to_bin(d)
% ��    �ܣ� ��0~255֮�������ת����8λ�����ƴ�
% ���÷�ʽ�� str=dec_to_bin(d)
% ����˵���� d -- 0~255֮�������
% �� �� ֵ�� 8λ�����ƴ�
% ʾ    ���� str=dec_to_bin(200)
%               ='11001000'

if d>255 | d<0
    error('�����д�');
end
ret='00000000';
bin=dec2bin(double(d));
count=size(bin);
for i=1:count(2)
    ret(9-i)=bin(count(2)+1-i);
end
