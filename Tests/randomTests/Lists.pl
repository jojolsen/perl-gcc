#!/usr/bin/perl -w
use warnings;
use strict;

my $month;
print "What month do you want to select?\n";
$month = <STDIN>;
print qw<
	January February March April May
	June July August September October November December>[$month-1];