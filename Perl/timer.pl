print "�����붨ʱ��ʱ�䣨���ӣ���\n";

$time = <STDIN>;
if(!($time=~/\d+/)) #����Ҫ��׳�������жϲ�����
{
    print"�������\n";
    exit();
}
chomp($time);

$time2sleep = $time *60;
if($time2sleep==0) #��ֹ���� ww2���������ַ������и��õ�ƥ���鷽ʽ��
{
    print"�������\n";
    exit();
}
while($time2sleep)
{
sleep(1);
print("��ʱ��ʣ�� $time2sleep ��\n");
$time2sleep--;
}
for($i=0;$i<10;$i++)
{
printf("\7");
}
print("��ʱ������\n");

