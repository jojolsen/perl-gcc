#!/usr/bin/perl -w
use warnings;
use strict;

#---initializations---#
system("title=The Game");
my $found = 0;
my $select = 'y';
my $continue = 1;
my @guysDorms = (
	'memorial',
	'hicks',
	'lincoln',
	'hopeman',
	'ketler'
	);
my $guysDormsSize = @guysDorms;
my @girlsDorms = (
	'map',
	'harker',
	'mep'
	);
my @cafes = (
	'hicks cafe',
	'map cafe'
	);
my @allThePlaces = (\@guysDorms, \@girlsDorms, \@cafes);

#---program start---#
while($select eq 'y')
{
	system("CLS");
	$found = 0;
	print "Where do you want to go?\n";
	chomp(my $toGo = <>);
	foreach my $row(@allThePlaces)
	{
		foreach my $val(@$row)
		{
			if(lc($toGo) eq lc($val))
			{
				$found = 1;
				last;
			}
		}
		if($found == 1)
		{
			last;
		}
	}

	#print "\n";

	if($found == 0)
	{
		print "There is no such place on campus.\n";
	}
	else
	{
		print "OK! You are now at ", uc($toGo), "!\n\n";
	}
	
	print "Continue? (y/n)\n";
	chomp($select = <>);
	$select = lc($select);
}


print "Program exited.";