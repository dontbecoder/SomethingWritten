function x=statistic(y)   %ͳ�Ƹ�Ƶϵ����Ԫ��ֵ�ľ���ֵС��0.5��Ԫ����ռ�ı���

Sum=0; %������ʼֵ

[m,n]=size(y);

[cA1,cH1,cV1,cD1]=dwt2(y,'haar');    % haarС���任                       
for i=1:m/2
    for j=1:n/2
        k1=cH1(i,j);
        k2=cV1(i,j);
        k3=cD1(i,j);
        if abs(k1)<0.5;
            Sum=Sum+1;
        end
        if abs(k2)<0.5;
            Sum=Sum+1;
        end
        if abs(k3)<0.5;
            Sum=Sum+1;
        end
    end
end
x=Sum/((m/2)*(n/2)*3);