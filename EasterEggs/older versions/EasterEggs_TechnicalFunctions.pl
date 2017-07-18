#-------File:	Easter Eggs-Technical Functions----#
#-------Author:	Josiah Dunham----------------------#
#-------Date:	April, 2013------------------------#

sub cls
{
	system("cls");
}

sub pause
{
	my %P = @_;
	unless($P{phrase})
	{
		$P{phrase}="Press any key to continue...";
	}
	print "$P{phrase}\n";

	ReadMode('cbreak');
	$key = ReadKey(0);
	ReadMode('normal');
}
sub textColor
{
	my ($thecolor) = @_;
	eval $@; 

		#print color "bold red";
		#pause($p=>"Invalid color");
		#print color "reset";
		#exit;
	
	print color "$thecolor";
}
sub countdown
{
	my %C = @_;
	#my $incl_timer = 0;
	$ticker = $C{ticker};
	my $message;
	my $message_copy;
	my $message2;
	my $switch1;
	my $switch2;
	unless($C{ticker})
	{
		$C{ticker} = 4;
	}
	unless($C{message})
	{
		$C{message} = "Default1";
	}
	$message = $C{message};
	if(index($message, "\*\*") != -1)
	{
		$message =~ s/\*\*/$ticker/g;
	}
	if($C{switch1})
	{
		$message_copy = $message;
		$switch1 = $C{switch1};
		$switch2 = $C{switch2};
		#search for switch 1, replace with switch 2, store in message 2
		$message_copy =~ s/$switch1/$switch2/g;
		$message2 = $message_copy;
	}
	#print "$message\n--------";
	#system("pause");
	for($ticker = $C{ticker}; $ticker >= 0; $ticker--)
		{
			$message =~ s/""/$ticker/g;
			$message2 =~ s/""/$ticker/g;
			system("cls");
			if($ticker != 1)
			{
				print "$message\n";
			}
			else
			{
				print "$message2\n";
			}
			$message =~ s/$ticker/""/g;
			$message2 =~ s/$ticker/""/g;
			sleep(1);
		};
}

1;