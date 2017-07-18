#-------File:	Easter Eggs-Main Page----#
#-------Author:	Josiah Dunham------------#
#-------Date:	April, 2013; Feb. 2014---#

#!/usr/bin/perl -w
use warnings;
use strict;
use Cwd;
use Win32::Console::ANSI;
use Term::ANSIColor;
use Scalar::Util qw(looks_like_number);
use Term::ReadKey;
my $option1;
my $option2;
my $to_input;
my $input;
my $p = "phrase";
my $t = "ticker";
my $m = "message";
my $s1 = "switch1";
my $s2 = "switch2";
my $egg_count = 0;
my $was_egg_added = 0;
my $color1 = "bold magenta";
my $color2 = "bold blue";
my $color3 = "bold yellow";
my $color4 = "bold white";
my $input_color = "bold cyan";
my $current_egg;
my $egg_descript;

#Egg arrays and lengths
my @zoneA;
my $aLength = @zoneA;
my @zoneB;
my $bLength = @zoneB;
my @zoneC;
my $cLength = @zoneC;
my @zoneD;
my $dLength = @zoneD;
my @zoneE;
my $eLength = @zoneE;
my @zoneF;
my $fLength = @zoneF;
my @zoneG;
my $gLength = @zoneG;
my @zoneH;
my $hLength = @zoneH;
my @totalEggs;
my $totalLength = @totalEggs;

main_menu();

#-------Easter Eggs-Functions----#
#---Main Menu---#
sub main_menu
{
	#Display the menu
	cls();
	print colored [$color1], "Easter Eggs Program ver. 2.3\n";
	print colored [$color2], "
1) View all eggs
2) View eggs by zone
3) Options
4) Info/Help
5) Administrator
6) Exit\n\n";

	print colored [$color3], "What would you like to do? ";

	#Select option
	$option1 = textIn();
	while(!(looks_like_number($option1)) || ($option1 < 1) || $option1 > 6)
	{
		textColor("bold red");
		print "\"$option1\" is not a valid selection. Please select an option numbered 1-6.\n";
		$option1 = textIn();
	}
	textColor("reset");
	if($option1 == 1) #View eggs
	{
		view_eggs();
	}
	elsif($option1 == 2) #View eggs by zone
	{
		view_eggs_by_zone();
	}
	elsif($option1 == 3) #Option menu
	{	
		#textColor($color3);
		options();
		#countdown($t=>5, $m=>"Options will be implemented in the 3.0 Version update. Returning to main menu in ** seconds.", $s1=>"seconds", $s2=>"second");
		
	}
	elsif($option1 == 4) #Info and help
	{
		textColor($color4);
		countdown($t=>5, $m=> "Info/Help will be implemented in the 3.0 Version update. Returning to main menu in ** seconds.", $s1=>"seconds", $s2=>"second");
		main_menu();
	}
	elsif($option1 == 5) #Admin menu
	{
		admin_menu();
	}
	else #Exit the program
	{
		cls();
		textColor($color3);
		print "Now Exiting...\n";
		textColor("Reset");
		sleep(1.99);
		exit;
	}	
}
#--------Main Menu Funtions------------#
sub view_eggs
{
	#prints out all of the eggs, separated by zone
	display_map();
	pause();
	cls();
	print colored [$color1], "A: Grandma's Back Porch\n";
	textColor($color2);
	for(my $i = 0; $i < $aLength; $i++)
	{
		print $i+1 . ") $zoneA[$i]\n";
	}
	textColor("reset");
	print colored [$color1], "\nB: Grandma's Side Lawn\n";
	textColor($color2);
	for(my $i = 0; $i < $bLength; $i++)
	{
		print $i+1 . ") $zoneB[$i]\n";
	}
	textColor("reset");
	print colored [$color1], "\nC: Grandma's Front Yard\n";
	textColor($color2);
	for(my $i = 0; $i < $cLength; $i++)
	{
		print $i+1 . ") $zoneC[$i]\n";
	}
	textColor("reset");
	print colored [$color1], "\nD: Grandma's Middle Walkway\n";
	textColor($color2);
	for(my $i = 0; $i < $dLength; $i++)
	{
		print $i+1 . ") $zoneD[$i]\n";
	}
	textColor("reset");
	print colored [$color1], "\nE: Sletta's Front Yard/Porch\n";
	textColor($color2);
	for(my $i = 0; $i < $eLength; $i++)
	{
		print $i+1 . ") $zoneE[$i]\n";
	}
	textColor("reset");
	print colored [$color1], "\nF: Sletta's Side Yard\n";
	textColor($color2);
	for(my $i = 0; $i < $fLength; $i++)
	{
		print $i+1 . ") $zoneF[$i]\n";
	}
	textColor("reset");
	print colored [$color1], "\nG: Sletta's Middle Walkway\n";
	textColor($color2);
	for(my $i = 0; $i < $gLength; $i++)
	{
		print $i+1 . ") $zoneG[$i]\n";
	}
	textColor("reset");
	print colored [$color1], "\nH: Backyard\n";
	textColor($color2);
	for(my $i = 0; $i < $hLength; $i++)
	{
		print $i+1 . ") $zoneH[$i]\n";
	}
	textColor($color3);
	print "\nTotal eggs: $egg_count\n\n\n";
	textColor("reset");
	pause($p=>"Press any key to return to the main menu.");
	main_menu();
}
sub view_eggs_by_zone
{
	cls();
	#print $zones{"1"};
	#pause();
	my $zone;
	print "Select zone to view (Not case sensitive)\n
A: Grandma's Back Porch
B: Grandma's Side Lawn
C: Grandma's Front Yard
D: Grandma's Middle Walkway
E: Sletta's Front Yard/Porch
F: Sletta's Side Yard
G: Sletta's Middle Walkway
H: Backyard

Zone: ";
	$zone = textIn();
	while((looks_like_number($zone)) || ((lc($zone) ne 'a') && (lc($zone) ne 'b') && (lc($zone) ne 'c') && (lc($zone) ne 'd') && (lc($zone) ne 'e') && (lc($zone) ne 'f') && (lc($zone) ne 'g') && (lc($zone) ne 'h')))
	{
		print "Invalid!\n";
		$zone = textIn();
	}
	cls();
	if(lc($zone) eq 'a')
	{
		print colored [$color1], "A: Grandma's Back Porch\n";
		for(my $i = 0; $i < $aLength; $i++)
		{
			print $i+1 . ") $zoneA[$i]\n";
		}
	}
	elsif(lc($zone) eq 'b')
	{
		print colored [$color1], "\nB: Grandma's Side Lawn\n";
		for(my $i = 0; $i < $bLength; $i++)
		{
			print $i+1 . ") $zoneB[$i]\n";
		}
	}
	elsif(lc($zone) eq 'c')
	{
		print colored [$color1], "\nC: Grandma's Front Yard\n";
		for(my $i = 0; $i < $cLength; $i++)
		{
			print $i+1 . ") $zoneC[$i]\n";
		}
	}
	elsif(lc($zone) eq 'd')
	{
		print colored [$color1], "\nD: Grandma's Middle Walkway\n";
		for(my $i = 0; $i < $dLength; $i++)
		{
			print $i+1 . ") $zoneD[$i]\n";
		}
	}
	elsif(lc($zone) eq 'e')
	{
		print colored [$color1], "\nE: Sletta's Front Yard/Porch\n";
		for(my $i = 0; $i < $eLength; $i++)
		{
			print $i+1 . ") $zoneE[$i]\n";
		}
	}
	elsif(lc($zone) eq 'f')
	{
		print colored [$color1], "\nF: Sletta's Side Yard\n";
		for(my $i = 0; $i < $fLength; $i++)
		{
			print $i+1 . ") $zoneF[$i]\n";
		}
	}
	elsif(lc($zone) eq 'g')
	{
		print colored [$color1], "\nG: Sletta's Middle Walkway\n";
		for(my $i = 0; $i < $gLength; $i++)
		{
			print $i+1 . ") $zoneG[$i]\n";
		}
	}
	else
	{
		print colored [$color1], "\nH: Backyard\n";
		for(my $i = 0; $i < $hLength; $i++)
		{
			print $i+1 . ") $zoneH[$i]\n";
		}
	}
	pause($p=>"\nPress any key to return to the main menu");
	main_menu();
}
sub options
{
	my $color_option;
	cls();
	textColor($color1);
		print "Options - Change color scheme:\n\n";
		#Color option 1 (Default)
		print colored [$color2], "Option 1 (Default):\n";
		print colored ['bold magenta'], "   Primary color\n";
		print colored ['bold blue'], "   Secondary color\n";
		print colored ['bold yellow'], "   Tertiary color\n";
		print colored ['bold white'], "   Special\n\n";
		#Color option 2
		print colored [$color2], "Option 2:\n";
		print colored ['bold blue'], "   Primary color\n";
		print colored ['bold green'], "   Secondary color\n";
		print colored ['bold white'], "   Tertiary color\n";
		print colored ['bold yellow'], "   Special\n\n";
		#Color option 3
		print colored [$color2], "Option 3:\n";
		print colored ['bold red'], "   Primary color\n";
		print colored ['bold white'], "   Secondary color\n";
		print colored ['bold blue'], "   Tertiary color\n";
		print colored ['blue'], "   Special\n\n";
		#Color option 4
		print colored [$color2], "Option 4:\n";
		print colored ['magenta'], "   Primary color\n";
		print colored ['bold yellow'], "   Secondary color\n";
		print colored ['bold blue'], "   Tertiary color\n";
		print colored ['green'], "   Special\n\n";
		#Color option 5
		print colored [$color2], "Option 5:\n";
		print colored ['bold white'], "   Primary color\n";
		print colored ['bold green'], "   Secondary color\n";
		print colored ['bold blue'], "   Tertiary color\n";
		print colored ['magenta'], "   Special\n\n";
		#Color option 6 - Choose your own
		#print colored [$color2], "Option 6: Choose your own. (Not yet implemented)\n";
		print colored [$color3], "Color selection: ";
		$color_option = textIn();
		while(!(looks_like_number($color_option)) || ($color_option < 1 || $color_option > 5))
		{
			textColor("bold red");
			print "\"$color_option\" is not a valid selection. Please enter an option numbered 1-5.\n";
			textColor("Reset");
			$color_option = textIn();
		}
		if($color_option == 1)
		{
			$color1 = "bold magenta";
			$color2 = "bold blue";
			$color3 = "bold yellow";
			$color4 = "bold white";
		}
		elsif($color_option == 2)
		{
			$color1 = "bold blue";
			$color2 = "bold green";
			$color3 = "bold white";
			$color4 = "bold yellow";
		}
		elsif($color_option == 3)
		{
			$color1 = "bold red";
			$color2 = "bold white";
			$color3 = "bold blue";
			$color4 = "blue";
		}
		elsif($color_option == 4)
		{
			$color1 = "magenta";
			$color2 = "bold yellow";
			$color3 = "bold blue";
			$color4 = "green";
		}
		elsif($color_option == 5)
		{
			$color1 = "bold white";
			$color2 = "bold green";
			$color3 = "bold blue";
			$color4 = "magenta";
		}
=colorChoice
		elsif($color_option == 6)
		{
			textColor($color4);
			countdown($t=>5, $m=> "\"Choose your own color\" will be implemented in a later version. Returning to options menu in ** seconds.", $s1=>"seconds", $s2=>"second");
			options();
		}
=cut
		
		main_menu();
}
#---Admin Menu---#
sub admin_menu
{
	$was_egg_added = 0;
	cls();
	print colored [$color1], "Administrator Menu - Add eggs:\n\n";
	print colored [$color2], "1) Manually
2) From File
3) Return to main menu\n\n";

	print colored [$color3], "Enter selection: ";
	$option2 = textIn();
	while(!(looks_like_number($option2)) || ($option2 < 1) || ($option2 > 3))
	{
		textColor("bold red");
		print "\"$option2\" is not a valid selection. Please select an option numbered 1-6.\n";
		$option2 = textIn();
	}
	textColor("reset");
	if($option2 == 1)
	{
		cls();
		manualEnter();
	}
	elsif($option2 == 2)
	{
		import_eggs();
		#countdown($t=>5, $m=>"Importing eggs from a file will be implemented in a future version. Returning to main menu in ** seconds.", $s1=>"seconds", $s2=>"second");
		#main_menu();
	}
	else
	{
		main_menu();
	}
}
#---Admin Menu Funtions---#
sub manualEnter
{
	display_map();
	print "Enter the zone and description of the eggs\n";
	print "Use the following syntax: ";
	print colored [$color3], " zone#\\description\n\n";
	textColor("Reset");
	print "Add (o)ne egg, or (m)ultiple eggs?\n";
	$to_input = textIn();
	
	while(lc($to_input) ne 'o' && lc($to_input) ne 'm')
	{
		print colored ['bold red'], "Please enter 'o' for one egg, or 'm' for multiple.\n";
		$to_input = textIn();
	}
	my $number_of_loops;
	if(lc($to_input) eq 'o')
	{
		my $current_egg_count = $egg_count;
		$number_of_loops = 1;
		egg_input();
		display_map();
		print "Enter the zone and description of the eggs\n";
		print "Use the following syntax: ";
		print colored [$color3], " zone#\\description\n\n";
		textColor("Reset");
		if($current_egg_count < $egg_count)
		{
			print colored ['bold green'], "Egg Added!\n";
			sleep(1.5);
			print "Write eggs to a file to save the current list?\n1) Yes\n2) No\n";
			textColor($input_color);
			my $writeResponse = textIn();
			textColor("Reset");
			if($writeResponse == 1)
			{
				open EGG_FILE, ">>EggList2.txt" or die $!;
				foreach my $line (@totalEggs)
				{
					print EGG_FILE "$line\n";
				}
				close EGG_FILE;
				print "List written to file!";
			}
			else
			{
				print "List not written to file.";
			}
			pause($p=>"Press any key to return to the Admin menu.");
		}

		
		admin_menu();
	}
	else
	{
		print "Enter eggs - enter 'done' to exit.\n\n";
		my $continue = "";
		while($continue ne 'done')
		{
			$continue = egg_input();
		}
		print "Write eggs to a file to save the current list?\n1) Yes\n2) No\n";
		textColor($input_color);
		my $writeResponse = textIn();
		textColor("Reset");
		if($writeResponse == 1)
		{
			open EGG_FILE, ">>EggList2.txt" or die $!;
			
			foreach my $line (@totalEggs)
			{
				print EGG_FILE "$line\n";
			}
			
			close EGG_FILE;
			print "List written to file!";
		}
		else
		{
			print "List not written to file.";
		}
		pause($p=>"Press any key to return to the Admin menu.");
		admin_menu();
	}
}

sub import_eggs
{
	#Later there will be an option to chose which file to open - now defaults to EggList.txt
	cls();
	my $d = getcwd;
	my $eggFile = "EggList2.txt";
	
	
	
	textColor($color1);
	print "Default egg list is: ";
	print colored[$color2], "$d/$eggFile\n";
	print colored[$color1], "Press enter to continue with this list,\nor type the name of the directory you wish to open.\n";
	my $newFile = textIn();
	if($newFile ne "")
	{
		$d = $newFile;
	}
	opendir(D, "$d") || die "Can't open directory $d: $!\n";
	my @list = readdir(D);
	my $listLength = @list;
	closedir(D);
	
	for(my $i = 2; $i < $listLength; $i++)
	{
		print $i-1 . ") $list[$i]\n";
	}
	pause();
	
	open EGG_FILE, "<$eggFile" or die $!;
	
	while(<EGG_FILE>)
	{
		my $egg_to_add = $_;
		chomp($egg_to_add);
		
		$egg_descript = substr($egg_to_add, 2, length($egg_to_add) - 1);
		
		my $first = substr($egg_to_add, 0, 1);
		
		if(lc($first) eq 'a' || lc($first) eq 'b' || lc($first) eq 'c' || lc($first) eq 'd' || lc($first) eq 'e' || lc($first) eq 'f' || lc($first) eq 'g' || lc($first) eq 'h')
		{
			$egg_count = $egg_count + 1;
			$current_egg = "$egg_descript [$egg_count]";

			if(lc($first) eq 'a')
			{	
				push(@zoneA, $current_egg);
				$aLength = @zoneA;
			}
			elsif(lc($first) eq 'b')
			{
				push(@zoneB, $current_egg);
				$bLength = @zoneB;
			}
			elsif(lc($first) eq 'c')
			{
				push(@zoneC, $current_egg);
				$cLength = @zoneC;
			}
			elsif(lc($first) eq 'd')
			{	
				push(@zoneD, $current_egg);
				$dLength = @zoneD;
			}
			elsif(lc($first) eq 'e')
			{
				push(@zoneE, $current_egg);
				$eLength = @zoneE;
			}
			elsif(lc($first) eq 'f')
			{
				push(@zoneF, $current_egg);
				$fLength = @zoneF;
			}
			elsif(lc($first) eq 'g')
			{
				push(@zoneG, $current_egg);
				$gLength = @zoneG;
			}
			elsif(lc($first) eq 'h')
			{
				push(@zoneH, $current_egg);
				$hLength = @zoneH;
			}
		}
	}
	close EGG_FILE;
	
	#give error message saying which eggs weren't added
	#offer to make fixes? Just an error messgae, user needs to fix himself?
	main_menu();	
}

sub egg_input
{
	my $badZone = 0;
	my $badSyntax = 0;
	my $altBadSyntax = 0;
	display_map();
	print "Enter the zone and description of the eggs\n";
	print "Use the following syntax: ";
	print colored [$color3], " zone#\\description\n\n";
	textColor("Reset");
	if($was_egg_added == 1)
	{
		print colored ['bold green'], "Egg Added!\n";
		#push(@totalEggs, $input);
		sleep(1.5);
		display_map();
		print "Enter the zone and description of the eggs\n";
		print "Use the following syntax: ";
		print colored [$color3], " zone#\\description\n\n";
		textColor("Reset");
	}
	print "Input: ";
	$input = textIn();
	my $char = "\\";
	my $result = index($input, $char);
	my $first = substr($input, 0, 1);
	if($result != 1)
	{
		if(lc($input) eq 'done')
		{
			$was_egg_added = 0;
			return $input;
		}
		$badSyntax = 1;
	}
	else
	{
		if(lc($first) ne 'a' && lc($first) ne 'b' && lc($first) ne 'c' && lc($first) ne 'd' && lc($first) ne 'e' && lc($first) ne 'f' && lc($first) ne 'g' && lc($first) ne 'h')
		{
			$badZone = 1;
		}
		elsif(length($input) == 2)
		{
			$badSyntax = 1;
			$altBadSyntax = 1;
		}
	}
	while($badZone == 1 || $badSyntax == 1 )
	{
		display_map();
		if($badZone == 1)
		{
			print colored ['bold red'], "Invalid Zone ID!\n";
			sleep(1.5);
			display_map();
		}
		elsif($badSyntax = 1)
		{
			if($altBadSyntax == 1)
			{
				print colored ['bold red'], "Invalid Syntax - No Description!\n";
			}
			else
			{
				print colored ['bold red'], "Invalid Syntax!\n";
			}
			sleep(1.5);
			display_map();
		}
		print "Enter the zone and description of the eggs\n";
		print "Use the following syntax: ";
		print colored [$color3], " zone#\\description\n\n";
		textColor("Reset");
		print "Input: ";
		$input = textIn();
		$first = substr($input, 0, 1);
		$result = index($input, $char);
		$badZone = 0;
		$badSyntax = 0;
		$altBadSyntax = 0;
		if($result != 1)
		{
			if(lc($input) eq 'done')
			{
				pause($p=>"Done adding eggs. Press any key to return to admin menu.\n");
				return $input;
			}
			$badSyntax = 1;
		}
		else
		{
			if(lc($first) ne 'a' && lc($first) ne 'b' && lc($first) ne 'c' && lc($first) ne 'd' && lc($first) ne 'e' && lc($first) ne 'f' && lc($first) ne 'g' && lc($first) ne 'h')
			{
				$badZone = 1;
			}
			elsif(length($input) == 2)
			{
				$badSyntax = 1;
				$altBadSyntax = 1;
			}
		}
	}
	
	$egg_count = $egg_count + 1;
	push(@totalEggs, $input);
	$egg_descript = substr($input, 2, length($input)-1);
	$current_egg = "$egg_descript [$egg_count]";
	if(lc($first) eq 'a')
	{	
		push(@zoneA, $current_egg);
		$aLength = @zoneA;
	}
	elsif(lc($first) eq 'b')
	{
		push(@zoneB, $current_egg);
		$bLength = @zoneB;
	}
	elsif(lc($first) eq 'c')
	{
		push(@zoneC, $current_egg);
		$cLength = @zoneC;
	}
	elsif(lc($first) eq 'd')
	{	
		push(@zoneD, $current_egg);
		$dLength = @zoneD;
	}
	elsif(lc($first) eq 'e')
	{
		push(@zoneE, $current_egg);
		$eLength = @zoneE;
	}
	elsif(lc($first) eq 'f')
	{
		push(@zoneF, $current_egg);
		$fLength = @zoneF;
	}
	elsif(lc($first) eq 'g')
	{
		push(@zoneG, $current_egg);
		$gLength = @zoneG;
	}
	else
	{
		push(@zoneH, $current_egg);
		$hLength = @zoneH;
	}

	$was_egg_added = 1;
	return $input;
}
#-----Technical Functions-----#
sub cls
{
	system("cls");
}
sub pause
{
	my %P = @_;
	textColor($color4);
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
#-----Display Map-----#
sub display_map
{
	system("cls");
	textColor($color4);
	print "
+------------------------------|         |------------------------------+
|                              |         |                              |
|                              |         |      __       ++             |
|         +    [E]             |         |     /  \\      ++             |
|                              |         |     \\__/                     |
|                              |         |                  [C]         |
|             +-----------+    |         |  ____                        |
|         +-------------+ |    |         | /    \\                       |
|         |             | |    +---------+ \\____/                       |
|         |             | |                            +---------+      |
|    [F]  |   Sletta    | +                            |         |   [B]|
|         |             |    [G]                [D]    | Grandma |      |
|         |             |                              |         |      |
|         +-------------+                              +---------+      |
|                                                             [A]       |
|                                                                       |
|                                                                       |
|                                                                       |
|                                                                       |
|                                                                       |
|                               [H]                                     |
|                                                                       |
|                                                                       |
|                                                                       |
|                                                                       |
|                                                                       |
|                                                                       |
|                                                               _______ |
|                              +---------+                     / Shed / |
|                              |Playhouse|                    /______/  |
|                              +---------+                              |
+-----------------------------------------------------------------------+

";
print colored [$color1], "Different Zones:";
print colored [$color2], "
A: Grandma's Back Porch
B: Grandma's Side Lawn
C: Grandma's Front Yard
D: Grandma's Middle Walkway
E: Sletta's Front Yard/Porch
F: Sletta's Side Yard
G: Sletta's Middle Walkway
H: Backyard

";
}