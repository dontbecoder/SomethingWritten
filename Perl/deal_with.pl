

use strict;

my $source_file="simpleweixiao.txt";  #Դ�ļ���
my $dest_file="simpleweixiao_OK.txt"; #Ŀ���ļ���
my @dest=();
my $one;
my $number= 1;

open(SOURCE_FILE,"<$source_file") or die;
while(<SOURCE_FILE>)
{

s/[\d]|[\.\,\%\*]//g;      # let them to be space'_' 
push(@dest,$_);

}
close(SOURCE_FILE);

open(DEST,">$dest_file") or die;

foreach $one (@dest){
unless($one=~/^\s$/)  #�޳��հ���
{
print DEST "$number $one";
$number++;
}
}

close(DEST);
