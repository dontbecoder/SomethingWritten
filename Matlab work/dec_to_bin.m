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
