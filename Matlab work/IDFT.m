function xn=IDFT(Xk,N)    %����Ҷ�任��ժ�ԡ�MATLAB�����ִ����������źŴ��������ļ�DFT�ɶ�
n=[0:N-1];
k=n;
Wn=exp(-j*2*pi/N);
nk=n'*k;
Wnnk=Wn.^(-nk);
xn=Xk*Wnnk/N;