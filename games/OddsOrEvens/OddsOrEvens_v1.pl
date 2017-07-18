#///Odds Or Evens Ver. 1.0  ///#
#/// Author: Josiah Dunham  ///#
#///   Date: April, 2013	///#

#!/usr/bin/perl -w
use warnings;
use strict;
use Cwd;
use Win32::Console::ANSI;
use Term::ANSIColor;
use Scalar::Util qw(looks_like_number);
use Term::ReadKey;
use Time::HiRes qw(usleep);

#///Variables///#
my $p = "phrase";
my $num1;
my $num2;
my $num3;
my $result;
my $dieSides = 6;
my $correct = 0;
my $score = 0;
my $credit = 100;

#///--------------------------Program Start--------------------------///#
print "Odds or Evens?\n\n";
print "Ready?\n";
pause($p=>"Press any key to begin!");
cls();
print "Rolling 3 $dieSides-sided dice.\n(O)dds, or (E)vens?";
my $input = textIn();
while((lc($input) ne 'o') && (lc($input) ne 'e'))
{
	print "Error: Please enter \"o\" to guess odds, or \"e\" to guess evens.\n";
	sleep(2);
	cls();
	print "Rolling 3 $dieSides sided dice.\n(O)dds, or (E)vens?";
	$input = textIn();
}
shuffle();
if($result % 2 == 0)
{
	if(lc($input) eq 'e')
	{
		$correct = 1;
	}
	else
	{
		$correct = 0;
	}
	
}
else
{
	if(lc($input) eq 'o')
	{
		$correct = 1;
	}
	else
	{
		$correct = 0;
	}
}
if($correct == 1)
{
	print "Correct!\n";
}
else
{
	print "Incorrect.\n";
}
pause();
#///--------------------------Program End----------------------------///#

#///Functions///#
sub shuffle
{
	for(my $i = 0; $i < 40; $i++)
	{
		cls();
		$num1 = int(rand(6)) + 1;
		$num2 = int(rand(6)) + 1;
		$num3 = int(rand(6)) + 1;
		$result = $num1 + $num2 + $num3;
		#print "$num1\n";
		print "$num1  +  $num2  +  $num3  = $result\n";
		usleep(50000);
	}
	return $result;
}
sub ouput
{
	cls();
	$result = $num1 + $num2 + $num3;
	print "$num1  +  $num2  +  $num3  = $result\n";
	pause();
}

#///Technical Funtions///#
sub nl
{
	print "\n";
}
sub cls
{
	system("cls");
}
sub textIn
{
	chomp(my $text = <>);
	return $text;
}
sub pause
{
	my %P = @_;
	unless($P{phrase})
	{
		$P{phrase}="Press any key to continue...";
	}
	print "$P{phrase}\n";
	ReadMode('cbreak');
	my $key = ReadKey(0);
	ReadMode('normal');
}
