

$x = 8731;

$a= 0;

$i=20;
$j=0;
for($i=20;$i>0;$i--)
{
$j++;
$z = $x * (1+0.035)**$i;
$a = $a + $z;

print "第$i年本息",$z,"\n";

print "$j年累加余额",$a,"\n";
}
#print "********************************\n";
#print $a;