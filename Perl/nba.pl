#!/usr/bin/perl -w

use strict;

my @Year=(
'��=>1','��=>2','��=>3','î=>4','��=>5','��=>6',
'��=>7','δ=>8','��=>9','��=>10','��=>11','��=>12',
);
foreach my $year(@Year){
print "$year\t";
}
print"\n\n";
#=============================================
my @bagua=(
'Ǭ=>1','��=>2','��=>3','��=>4',
'��=>5','��=>6','��=>7','��=>8',
);

foreach my $gua(@bagua){
print "$gua\t";
}
print"\n\n";
#=============================================
my(@SouthWest,@NorthWest,@Pacific,
   @SouthEast,@Atlantic,@Middle,
);

my $team_name;

@SouthWest=(
'Spurs','Grizzlies','Mavericks','Rockets','Pelicans',
);

@NorthWest=(
'Timberwolves','Nuggets','Trail Blazers','Thunder','Jazz'
);

@Pacific=(
'Kings','Suns','Lakers','Clippers','Warriors',
);

@SouthEast=(
'Heat','Magic','Hawks','Wizards','Bobcats',
);

@Atlantic=(
'Celtics','76ers','Knicks','Nets','Raptors',
);

@Middle=(
'Pistons','Pacers','Cavaliers','Bulls','Bucks',
);

#=====================================
=comment
@SouthWest=(
'Spurs','Grizzlies','Mavericks','Rockets','Pelicans',
);

@NorthWest=(
'Timberwolves','Nuggets','Trail Blazers','Thunder','Jazz'
);

@Pacific=(
'Kings','Suns','Lakers','Clippers','Warriors',
);

@SouthEast=(
'Heat','Magic','Hawks','Wizards','Bobcats',
);

@Atlantic=(
'Celtics','76ers','Knicks','Nets','Toronto Raptors',
);

@Middle=(
'Pistons','Pacers','Cavaliers','Bulls','Bucks',
);
=cut
#=====================================

#my @All_team=(@SouthWest,@NorthWest,@Pacific,
#   @SouthEast,@Atlantic,@Middle );
print"������\t";
foreach $team_name (@SouthWest){	
print "$team_name\t";
}
print"\n\n";
print"������\t";
foreach $team_name (@NorthWest){	
print "$team_name\t";
}
print"\n\n";
print"̫ƽ����\t";
foreach $team_name (@Pacific){	
print "$team_name\t";
}
print"\n\n";
print"������\t";
foreach $team_name (@SouthEast){	
print "$team_name\t";
}
print"\n\n";
print"��������\t";
foreach $team_name (@Atlantic){	
print "$team_name\t";
}
print"\n\n";
print"�в���\t";
foreach $team_name (@Middle){	
print "$team_name\t";
}
print"\n";
