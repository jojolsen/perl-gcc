#!/usr/bin/perl -w
#system("mode CON: LINES=50 COLS=100");
use warnings;
use strict;
use Cwd;
use Win32::Console::ANSI;
use Term::ANSIColor;
use Scalar::Util qw(looks_like_number);
use Term::ReadKey;
use Time::HiRes qw(usleep);
my $SLEEP_TIME = 50000;
my $TIMES = 40;

my $num1;

#for(my $j = 0; $j < 5; $j++)
#{
	for(my $i = 0; $i < $TIMES; $i++)
	{
		system("cls");
		$num1 = int(rand(6)) + 1;
		print "$num1\n";
		usleep($SLEEP_TIME);
	}
	for(my $i = 0; $i < $TIMES-20; $i++)
	{
		system("cls");
		$num1 = int(rand(6)) + 1;
		print "$num1\n";
		$SLEEP_TIME = $SLEEP_TIME + 20000;
		print "Sleep Time = $SLEEP_TIME\n";
		usleep($SLEEP_TIME);
	}
	$SLEEP_TIME = $SLEEP_TIME + 25000;
	#$TIMES = $TIMES - 10;
#}

system("pause");