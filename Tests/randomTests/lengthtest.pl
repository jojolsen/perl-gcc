#!/usr/bin/perl -w
use warnings;
use strict;
use Cwd;
use Win32::Console::ANSI;
use Term::ANSIColor;
use Scalar::Util qw(looks_like_number);

my $num;
chomp($num = <>);
while(!(looks_like_number($num)) || ($num < 0))
{
	print "$num is not a number. Please enter a number.\n";
	chomp($num = <>);
}

=comment
my @exprs = qw(1 5.25 0.001 1.3e8 foo bar 1dd);

foreach my $expr (@exprs) {
    print "$expr is", looks_like_number($expr) ? '' : ' not', " a number\n";
}
`pause`;
=cut
=comment
my $path = "c:/users/dunhamjp2/";
if(-d $path)
{
	print "yes";
}
else
{
	print "no";
}
`pause`;

=cut