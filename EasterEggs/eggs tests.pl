#!/usr/bin/perl -w
use warnings;
use strict;
use Cwd;
use Win32::Console::ANSI;
use Term::ANSIColor;
use Scalar::Util qw(looks_like_number);
use Term::ReadKey;


print "Enter a comment: ";
my $comment = textIn();
print $comment;

=old test1
my @colors;

#open FILE, ">Colors.txt" or die $!;
my $color1; 
my $color2;
my $color3;
my $color4;
print "Enter primary color: ";
chomp($color1 = <>);
print "Enter secondary color: ";
chomp($color2 = <>);
print "Enter tertiary color: ";
chomp($color3 = <>);
print "Enter specialty color: ";
chomp($color4 = <>);
print "Save? ";
chomp(my $input = <>);
if(lc($input) eq 'y')
{
	open FILE, ">Colors.txt" or die $!;
	print FILE "$color1\n$color2\n$color3\n$color4";
	close FILE;
}
#my $table = "Hello, World!";
#print FILE $table;
#close FILE;

open FILE, "<Colors.txt" or die $!;
while (<FILE>)
{
	my $line = $_;
	push(@colors, $line);
	#print "$line";
}
$color1 = $colors[0];
$color2 = $colors[1];
$color3 = $colors[2];
$color4 = $colors[3];

print "The colors are: ";
print $color1;
print ", ";
#print 'The colors are: ' . $color1 . ', ' . $color2 . ', ' . $color3 . ', and ' . $color4 . ".\n";
close FILE;
#while (<FILE>)
#{
#	my $line = $_;
#	print "$line";
#}
=cut
`pause`;