#!/usr/bin/perl -w
use warnings;
use strict;
use Cwd;
use Win32::Console::ANSI;
use Term::ANSIColor;
use Scalar::Util qw(looks_like_number);
use Term::ReadKey;
use Time::HiRes qw(usleep);


my $numOfSpins = int(rand(10000) + 45000);
#45000 - 55000
print $numOfSpins . "\n";
=yup
my @wheel = qw(0 28 9 26 30 11 7 20 32 17 5 22 34 15 3 24 36 13 1 00 27 10 25 29 12 8 19 31 18 6 21 33 16 4 23 35 14 2);
my @colors = qw(g b r b r b r b r b r b r b r b r b r g r b r b r b r b r b r b r b r b r b);
my $subt = 27;
my $color;
my $ball = "blue";
my $black = "white on_black";
my $red = "white on_red";
my $green = "white on_green";
print colored [$green], "$wheel[0] ";
for(my $i = 1; $i < 10; $i++)
{
	if($colors[$i] eq 'b')
	{
		$color = $black;
	}
	elsif($colors[$i] eq 'r')
	{
		$color = $red;
	}
	print colored [$color], "$wheel[$i] ";
	
}
print "\n\n";
for(my $i = 10; $i < 19; $i++)
{
	if($colors[$i] eq 'b')
	{
		$color = $black;
	}
	elsif($colors[$i] eq 'r')
	{
		$color = $red;
	}
	print colored [$color], "$wheel[$i+$subt]";
	print "			   ";
	print colored [$color], "$wheel[$i]\n\n";
	$subt = $subt - 2;
}
for(my $i = 28; $i > 19; $i--)
{
	if($colors[$i] eq 'b')
	{
		$color = $black;
	}
	elsif($colors[$i] eq 'r')
	{
		$color = $red;
	}
	print colored [$color], "$wheel[$i] ";
}
print colored [$green], "$wheel[19]";
print "\n";
=cut
system("pause");