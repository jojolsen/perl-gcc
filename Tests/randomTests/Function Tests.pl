#!/usr/bin/perl -w
use warnings;
use strict;
use Cwd;
use Win32::Console::ANSI;
use Term::ANSIColor;
use Scalar::Util qw(looks_like_number);

begin();

while(1)
{
	chomp(my $color = <>);
	textColor($color);
	#eval {textColor("$color")}; warn "NOOOPE" if $@;
	print "$color\n";
	textColor("reset");
}

=adding
print "Enter 2 numbers to add\n";
chomp(my $x = <>);
print "\n";
chomp(my $y = <>);
textColor("reset");
print "\n\n";
#my $z = 
print "The value of $x + $y is ", add_two_nums($x, $y);
`pause`;

sub add_two_nums
{
	my ($num1, $num2) = @_;
	my $sum = $num1 + $num2;
	return $sum;	
}
=cut

sub begin
{
	print "Beginning program\n";
}

sub textColor
{

	my ($thecolor) = @_;
	#my $colorLen = length($color);
	#if(substr($color, 0, 2) eq "b ")
	#{
	#	$color = "bold " . substr($color, 2, $colorLen - 1);
	#}
	#print "$color";
	print color "$thecolor";


}
