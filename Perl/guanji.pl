

print"������ػ�ʱ�䣨�֣���\n";
$time=<STDIN>;
chomp($time);
if($time=~/\d+/)
{
$time=$time*60;
}
else{
print"��������\n";
exit;
}
system("shutdown -s -t $time");

