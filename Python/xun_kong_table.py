# -*- coding: gbk 

# start
'''
a=['��','��','��','��','��','��','��','��','��','��']

b=['��','��','��','î','��','��','��','δ','��','��','��','��']

a =a * 6

b = b * 5

x =[]

for i in range(0,60):
	 x.append(a[i]+b[i])

print(x)
'''
# end


Xun_kong_table={
'����':'�纥', '�ҳ�':'�纥', '����':'�纥', '��î':'�纥', '�쳽':'�纥', '����':'�纥', '����':'�纥', '��δ':'�纥', '����':'�纥','����':'�纥',

'����':'����', '�Һ�':'����', '����':'����', '����':'����', '����':'����', '��î':'����', '����':'����', '����':'����', '����':'����','��δ':'����',

'����':'��δ', '����':'��δ', '����':'��δ', '����':'��δ', '����':'��δ', '����':'��δ', '����':'��δ', '��î':'��δ', '�ɳ�':'��δ','����':'��δ',

'����':'����', '��δ':'����', '����':'����', '����':'����', '����':'����', '����':'����', '����':'����', '����':'����', '����':'����','��î':'����',

'�׳�':'��î', '����':'��î', '����':'��î', '��δ':'��î', '����':'��î', '����':'��î', '����':'��î', '����':'��î', '����':'��î','���':'��î',

'����':'�ӳ�', '��î':'�ӳ�', '����':'�ӳ�', '����':'�ӳ�', '����':'�ӳ�', '��δ':'�ӳ�', '����':'�ӳ�', '����':'�ӳ�', '����':'�ӳ�','�ﺥ':'�ӳ�'

		}

date = input("Plz input the date\n")

print(Xun_kong_table[str(date)])