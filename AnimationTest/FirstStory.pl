#!/usr/bin/perl -w
system("mode CON: LINES=50 COLS=150");
use warnings;
use strict;
use Cwd;
use Win32::Console::ANSI;
use Term::ANSIColor;
use Scalar::Util qw(looks_like_number);
use Term::ReadKey;
use Time::HiRes qw(usleep);
my $p = "phrase";
my $UPDATE_TIME = 100000;

print "







                  O
                 /|\\                 
_________________/_\\___________________________
";

pause();

sub update
{
	usleep($UPDATE_TIME);
	cls();
}

sub cls
{
	system("cls");
}
sub pause
{
	my %P = @_;
	#textColor($color4);
	unless($P{phrase})
	{
		$P{phrase}="Press any key to continue...";
	}
	print "$P{phrase}\n";

	ReadMode('cbreak');
	my $key = ReadKey(0);
	ReadMode('normal');
	#textColor("reset");
}