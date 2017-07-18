#!/usr/bin/perl -w
use warnings;
use strict;
use Cwd;
use Win32::Console::ANSI;
use Term::ANSIColor;
use Scalar::Util qw(looks_like_number);
use Term::ReadKey;

#ticker, outputMessage
my $ticker;
countdown();

sub countdown
{
	my %C = @_;
	#my $incl_timer = 0;
	$ticker = $C{ticker};
	my $message;
	unless($C{ticker})
	{
		$C{ticker} = 4;
	}
	unless($C{message})
	{
		$C{message} = "Default";
	}
	$message = $C{message};
	if(index($message, "\*\*") != -1)
	{
		#$incl_timer = 1;
		$message =~ s/\*\*/$ticker/g;
	}
	#print "$message\n--------";
	#system("pause");
	for($ticker = $C{ticker}; $ticker >= 0; $ticker--)
		{
			$message =~ s/""/$ticker/g;
			system("cls");
			if($ticker != 1)
			{
				print "$message\n";
			}
			else
			{
				print "$message\n";
			}
			$message =~ s/$ticker/""/g;
			sleep(1);
		};
}