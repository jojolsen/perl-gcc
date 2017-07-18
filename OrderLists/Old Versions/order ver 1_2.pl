#-------File:	Order Lists--------------#
#-------Author:	Josiah Dunham------------#
#-------Date:	February, 2014-----------#

#!/usr/bin/perl -w
use warnings;
use strict;
use Cwd;
use Win32::Console::ANSI;
use Term::ANSIColor;
use Scalar::Util qw(looks_like_number);
use Term::ReadKey;

#---Arrays---#
my @uoList;
my @colorArray;

#---Variables---#
my $uoListLength = @uoList;
my $p = "phrase";
my $t = "ticker";
my $m = "message";
my $s1 = "switch1";
my $s2 = "switch2";

#---Color Variables---#

my $pauseColor = "bold yellow";
my $input_color = "bold green";


#---Program Start---#

setColorArray();
print "Order Lists ver. 1.2. Main Menu.\n";
print "Select data set:\n1) From File\n2) From Manual Entry\n";
my $menuChoice = textIn();
if($menuChoice == 1)
{
	fromFile();
}
else
{
	manualEntry();
}

#countdown($t=>5, $m=> "Clearing screen in ** seconds.", $s1=>"seconds", $s2=>"second");
#pause($p=>"Press a damn key, fool!");
#cls();
#my $test = textIn();
#textColor("bold red");
#print "$test";



#---Functions---#

sub fromFile
{
	my $d = "c:/users/dunhamjp1/desktop/perl/orderlists/";

	opendir(D, "$d") || die "Can't open directory $d: $!\n";
	my @list = readdir(D);
	my $listLength = @list;
	closedir(D);

	for(my $i = 2; $i < $listLength; $i++)
	{
		print $i-1 . ") $list[$i]\n";
	}
	pause();
	# cls();
	# open DATA_SET_FILE, "<dataset.txt" or die $!;
	# while(<DATA_SET_FILE>)
	# {
		# my $nextNum = $_;
		# chomp($nextNum);
		# push(@uoList, $nextNum);
		# $uoListLength = @uoList;
	# }
	# for(my $i = 0; $i < $uoListLength; $i++)
	# {
		# print $uoList[$i] . "\n";
	# }
	# pause($p=>"Done...");
	
	# print "Order data set by:\n1) Ascending Value\n2) Descending Value\n";
	# my $subMenuChoice = textIn();
	# if($subMenuChoice == 1)
	# {
		# asc();
	# }
	# else
	# {
		# dsc();
	# }
}
sub manualEntry
{
	cls();
	print "Input values, separated by \'Enter\'. Hit \'Enter\' with no value to complete list.\n";
	my $val = textIn();
	while($val ne "")
	{
		push(@uoList, $val);
		cls();
		print "Input values, separated by \'Enter\'. Hit \'Enter\' with no value to complete list.\n";
		$val = textIn();
		$uoListLength = @uoList;
	}
	for(my $i = 0; $i < $uoListLength; $i++)
	{
		print $uoList[$i] . "\n";
	}
	pause($p=>"Done...");
	print "Order data set by:\n1) Ascending Value\n2) Descending Value\n";
	my $subMenuChoice = textIn();
	if($subMenuChoice == 1)
	{
		asc();
	}
	else
	{
		dsc();
	}
	return;
}

sub asc
{
	cls();
	my @oList;
	my $oListLength = @oList;
	my $currentMin = $uoList[0];
	my $tempNum = 0;
	my $tempI = 0;
	
	for(my $i = 0; $i < $uoListLength; $i++)
	{
		$currentMin = $uoList[$i];
		for(my $j = $i; $j < $uoListLength; $j++)
		{
			if($currentMin >= $uoList[$j])
			{
				$currentMin = $uoList[$j];
				$tempI = $j;
			}
		}
		$tempNum = $uoList[$i];
		$uoList[$i] = $uoList[$tempI];
		$uoList[$tempI] = $tempNum;
	}
	for(my $i = 0; $i < $uoListLength; $i++)
	{
		textColor($colorArray[(int(rand(6)))]);
		print $uoList[$i] . "\n";
	}
	pause($p=>"Done...");
}
sub dsc
{
	cls();
	my @oList;
	my $oListLength = @oList;
	my $currentMax = $uoList[0];
	my $tempNum = 0;
	my $tempI = 0;
	
	for(my $i = 0; $i < $uoListLength; $i++)
	{
		$currentMax = $uoList[$i];
		for(my $j = $i; $j < $uoListLength; $j++)
		{
			if($currentMax <= $uoList[$j])
			{
				$currentMax = $uoList[$j];
				$tempI = $j;
			}
		}
		$tempNum = $uoList[$i];
		$uoList[$i] = $uoList[$tempI];
		$uoList[$tempI] = $tempNum;
	}
	for(my $i = 0; $i < $uoListLength; $i++)
	{
		textColor($colorArray[(int(rand(6)))]);
		print $uoList[$i] . "\n";
	}
	pause($p=>"Done...");
}


#-----Technical Functions-----#
sub cls
{
	system("cls");
}
sub pause
{
	my %P = @_;
	textColor($pauseColor);
	unless($P{phrase})
	{
		$P{phrase}="Press any key to continue...";
	}
	print "$P{phrase}\n";

	ReadMode('cbreak');
	my $key = ReadKey(0);
	ReadMode('normal');
	print color "reset";
	#textColor("reset");
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

sub setColorArray
{
	push(@colorArray, "bold red");
	push(@colorArray, "bold yellow");
	push(@colorArray, "bold green");
	push(@colorArray, "bold blue");
	push(@colorArray, "bold magenta");
	push(@colorArray, "bold white");
}
sub countdown
{
	my %C = @_;
	my $ticker = $C{ticker};
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
		#copy $message to $message_copy
		$message_copy = $message;
		$switch1 = $C{switch1};
		$switch2 = $C{switch2};
		#search for switch 1, replace with switch 2, store in message 2
		$message_copy =~ s/$switch1/$switch2/g;
		$message2 = $message_copy;
	}
	for($ticker = $C{ticker}; $ticker >= 0; $ticker--)
		{
			#replacing the number with null allows for the number to change - otherwise, it stays at the original set number
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
sub textIn
{
	print color $input_color;
	chomp(my $text = <>);
	print color "reset";
	return $text;
}
