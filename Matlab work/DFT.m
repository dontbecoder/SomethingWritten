function Xk=DFT(xn,N)    %����Ҷ�任��ժ�ԡ�MATLAB�����ִ����������źŴ������ļ�IDFT�ɶ�
n=[0:N-1];
k=n;
Wn=exp(-j*2*pi/N);
nk=n'*k;
Wnnk=Wn.^nk;
Xk=xn*Wnnk;