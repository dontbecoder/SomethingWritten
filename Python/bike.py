# -*- coding: gbk 

PI = 3.1415	# Բ����
Trans = 0.0254 	# ������
Wheel_size = 20	# �־�
Crankset = 50	# ���̳���
Fly_wheel = 39	# ���ֳ���
Distance = 0  	# �߾� 

Distance = Crankset/Fly_wheel * PI * Wheel_size * Trans
print (Distance)
