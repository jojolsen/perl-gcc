#!/usr/bin/perl -w
use warnings;
use strict;
use Cwd;
use Win32::Console::ANSI;
use Term::ANSIColor;
use Scalar::Util qw(looks_like_number);
use Term::ReadKey;
use Time::HiRes qw(usleep);
my $p = "phrase";
my $UPDATE_TIME = 100000;

###///Beginning of Main program///###

=trial1
print "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n";
print "******************************\n";
usleep(500000);
cls();
print "\n\n\n\n\n\n\n\n\n\n\n\n\n\n";
print "******************************\n";
print "******************************\n";
usleep(500000);
cls();
print "\n\n\n\n\n\n\n\n\n\n\n\n\n";
print "******************************\n";
print "******************************\n";
print "******************************\n";
usleep(500000);
cls();
print "\n\n\n\n\n\n\n\n\n\n\n\n";
print "******************************\n";
print "******************************\n";
print "******************************\n";
print "******************************\n";
usleep(500000);
cls();
print "\n\n\n\n\n\n\n\n\n\n\n";
print "******************************\n";
print "******************************\n";
print "******************************\n";
print "******************************\n";
print "******************************\n";
usleep(500000);
cls();
print "\n\n\n\n\n\n\n\n\n\n";
print "******************************\n";
print "******************************\n";
print "******************************\n";
print "******************************\n";
print "******************************\n";
print "******************************\n";
pause($p=>" ");
=cut

my @lines;
my $current_line;
for(my $i = 0; $i < 30; $i++)
{
	push(@lines, "\n");
}
my $line_size = @lines;
for(my $j = 0; $j < 5; $j++)
{
	shift(@lines);
	push(@lines, "******************************\n");
	foreach my $i(@lines)
	{
		print $i;
	}
	update();
}



for(my $j = 0; $j < 35; $j++)
{
	shift(@lines);
	push(@lines, "******************************\n");
	foreach my $i(@lines)
	{
		print $i;
	}
	update();
}




##///End of Main program///###


sub newLine
{
	$current_line = "* Hello, this is a test line *";
	return $current_line;
}

sub printArray
{
	for(my $j = 0; $j < $line_size; $j++)
	{
		print $lines[$j];
	}
}

sub update
{
	usleep($UPDATE_TIME);
	cls();
}

sub cls
{
	system("cls");
}
sub pause
{
	my %P = @_;
	#textColor($color4);
	unless($P{phrase})
	{
		$P{phrase}="Press any key to continue...";
	}
	print "$P{phrase}\n";

	ReadMode('cbreak');
	my $key = ReadKey(0);
	ReadMode('normal');
	#textColor("reset");
}