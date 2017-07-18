#!/usr/bin/perl -w
use warnings;
use strict;
use Cwd;
use Win32::Console::ANSI;
use Term::ANSIColor;
use Scalar::Util qw(looks_like_number);

#=comment

while(1)
{
	system("cls");
	print "First number: ";
	chomp(my $x = <>);
	print "\nSecond number: ";
	chomp(my $y = <>);
	my $ratio = $x/$y;
	$ratio = $ratio * 100;
	printf("%.2f", $ratio);
	my $rratio = sprintf "%.2f", $ratio;
	`echo $rratio 1>>answers.txt`;
	`pause`;
}
#=cut
#my $num = 4.2267;
#my $rounded = sprintf "%.2f", $num;
#print "$num\n$rounded";

#printf("%.3f", 3.1415926535);

`pause`;
