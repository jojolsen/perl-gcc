#!/usr/bin/perl
use warnings;
use strict;

#my $rand_num = int(rand(3));
my $found = 0;
my @guysDorms = (
	'memorial',
	'hicks',
	'lincoln',
	'hopeman',
	'ketler'
	);
my @girlsDorms = (
	'map',
	'harker',
	'mep'
	);
my @cafes = (
	'hicks cafe',
	'map cafe'
	);
my @allThePlaces =  ( [ @guysDorms ],
						 [ @girlsDorms], 
						 [ @cafes ]);
#print $allThePlaces[2][1];
my $arrSize = @allThePlaces;
print "Where do you want to go?\n";
chomp(my $toGo = <>);

for(my $i = 0; $i < $arrSize; $i++)
{
	for(my $j = 0; $j < $arrSize; $j++)
	{
		if(lc($toGo) eq lc($allThePlaces[$i][$j]))
		{
			$found = 1;
			last;
		}
	}
}
if($found == 0)
{
	print "There is no such place on campus.";
}
else
{
	print "OK! You are now at ", $toGo, "!";
}



#print $rand_num, "\n";
#print $places[$rand_num];