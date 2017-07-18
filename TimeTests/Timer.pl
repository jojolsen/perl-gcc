#!/usr/bin/perl -w
use warnings;
use strict;
use Cwd;
use Win32::Console::ANSI;
use Term::ANSIColor;
use Scalar::Util qw(looks_like_number);
use Term::ReadKey;
use Time::HiRes qw(usleep);

=notes
1) Seconds past the minute
2) Minutes past the hour
3) Hours past midnight
4) Day of the month
5) Months past the start of the year
6) Number of years since 1900
7) Number of days since the start of the week (Sunday)
8) Number of days since the start of the year
9) Whether or not daylight savings is active
=cut


my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime(time);
my ($fSec,$fMin,$fHour,$fMDay,$fMon,$fYear,$fWDay,$fYDay,$fIsDst);
my $dayNight;
my $countingDays = 0;
if($hour > 12)
{
	$hour = $hour - 12;
	$dayNight = "PM";
}
else
{
	$dayNight = "AM";
}
my @months = qw( Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec );
my @days = qw (Sunday Monday Tuesday Wednesday Thursday Friday Saturday);
my @numOfDays = qw(31 28 31 30 31 30 31 31 30 31 30 31);
$year += 1900;
if($year % 4 == 0)
{
	$numOfDays[1] = 29;
}

#my @timeData = localtime(time);
#print join(' ', @timeData);

$fMon = 4;
$fMDay = 8;
$fYDay = 0; # may 8th = 127
for(my $i = 0; $i < $fMon; $i++)
{
	$fYDay += $numOfDays[$i];
}
$fYDay = $fYDay + $fMDay - 1;
#print "Month = $months[$mon], Future month = $fMon\n";
#print $fMon - $mon . " Months, " $fDay - .\n";
print "$days[$wday], $hour:$min:$sec $dayNight, $months[$mon] $mday, $year\nDay number: $yday\n";
print "May 8th: $fYDay days after the new year\n";
$countingDays = $fYDay - $yday;
print "Days until May 8th: $countingDays\n";

=basicCounter

while(1)
{
	($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime(time);
	$year += 1900;
	if($sec < 10)
	{
		$sec = 0 . $sec;
	}
	print "$days[$wday], $hour:$min:$sec $dayNight, $months[$mon] $mday, $year\n";
	usleep(500000);
	system("cls");
}
=cut
system("pause");