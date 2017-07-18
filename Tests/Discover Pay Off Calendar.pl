#!/usr/bin/perl -w
use warnings;
use strict;
use Cwd;
use Win32::Console::ANSI;
use Term::ANSIColor;
use Scalar::Util qw(looks_like_number);

`title Credit Card Payoff Calculator`;

#prompt user for info
print "What is your current Credit Card balance?\n";
print color 'Bold green';
print '$';
chomp(my $balance = <>);
while(!(looks_like_number($balance)) || ($balance < 0))
{
	if(!(looks_like_number($balance)))
	{
		print colored ['bold red'], "Invalid balance. $balance is not a number. Please enter a valid number.\n"
	}
	else
	{
		print colored ['bold red'], "Invalid balance. $balance is negative. Please enter a valid number.\n"
	}
	print color 'Bold green';
	print '$';
	chomp($balance = <>);
}
print color 'reset';
print "\nHow much do you plan on spending per month?\n";
print color 'Bold green';
print '$';
chomp(my $spend = <>);
while(!(looks_like_number($spend)) || ($spend < 0))
{
	if(!(looks_like_number($spend)))
	{
		print colored ['bold red'], "Invalid amount. $spend is not a number. Please enter a valid number.\n"
	}
	else
	{
		print colored ['bold red'], "Invalid amount. $spend is negative. Please enter a valid number.\n"
	}
	print color 'Bold green';
	print '$';
	chomp($spend = <>);
}
print color 'reset';
print "\nHow much do you want to pay off per month?\n";
print color 'Bold green';
print '$';
chomp(my $payoff = <>);
while(!(looks_like_number($payoff)) || ($payoff < 0))
{
	if(!(looks_like_number($payoff)))
	{
		print colored ['bold red'], "Invalid amount. $payoff is not a number. Please enter a valid number.\n"
	}
	else
	{
		print colored ['bold red'], "Invalid amount. $payoff is negative. Please enter a valid number.\n"
	}
	print color 'Bold green';
	print '$';
	chomp($payoff = <>);
}
print color 'reset';
my $diff = $payoff - $spend;
my $months = 0;
my $lastMonth;

#check to see if you will encounter an infinite loop
if($spend >= $payoff)
{
	print colored['bold red'], "Error: If you're spending more than or equal to what you're paying off,\nyou will never pay off your bill.\n";
	print "Now exiting...";
	`pause`;
	exit;
}

#calculate months
for(my $i = $balance; $i > 0; $i = $i - $diff)
{
	if($i <= $diff)
	{
		$lastMonth = $i;
	}
	$months = $months + 1;
}

print "Total months until payoff: $months\n";

#details
print "To see the details, press 'd', or press any other key to exit.\n";
chomp(my $details = <>);
if(lc($details) eq 'd')
{
	print "\n" . $months-1 . ' months paying $' . $payoff . ' per month, and 1 month paying $' . $lastMonth;
	`pause`;
}
exit;
