#-------File:	Easter Eggs-Functions----#
#-------Author:	Josiah Dunham------------#
#-------Date:	April, 2013--------------#

require 'eggs_display.pl';
require 'EasterEggs_TechnicalFunctions.pl';
#variables
my $option1;
my $p = "phrase";
my $t = "ticker";
my $m = "message";
my $s1 = "switch1";
my $s2 = "switch2";
my $egg_count = 0;
my $was_egg_added = 0;

my %zones = ("1"=>"a", "2"=>"b", "3"=>"c", "4"=>"d", "5"=>"e", "6"=>"f", "7"=>"g", "8"=>"h");

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

sub main_menu
{
	#Display the menu
	cls();
	print "Easter Eggs Program ver. 1.0\n
1) View all eggs
2) View eggs by zone
3) Options
4) Info/Help
5) Administrator
6) Exit

What would you like to do? ";

	#Select option
	chomp($option1 = <>);
	while(!(looks_like_number($option1)) || ($option1 < 1) || $option1 > 6)
	{
		print "\"$option1\" is not a valid selection. Please select an option numbered 1-6.\n";
		chomp($option1 = <>);
	}
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
		countdown($t=>5, $m=>"Options will be implemented in the next version. Returning to main menu in ** seconds.", $s1=>"seconds", $s2=>"second");
		main_menu();
	}
	elsif($option1 == 4) #Info and help
	{
		countdown($t=>5, $m=> "Info/Help will be implemented in the next version. Returning to main menu in ** seconds.", $s1=>"seconds", $s2=>"second");
		main_menu();
	}
	elsif($option1 == 5) #Admin menu
	{
		admin_menu();
	}
	else #Exit the program
	{
		cls();
		textColor("bold yellow");
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
	print colored ['bold cyan'], "A: Grandma's Back Porch\n";
	for(my $i = 0; $i < $aLength; $i++)
	{
		print $i+1 . ") $zoneA[$i]\n";
	}
	print "\nB: Grandma's Side Lawn\n";
	for(my $i = 0; $i < $bLength; $i++)
	{
		print $i+1 . ") $zoneB[$i]\n";
	}
	print "\nC: Grandma's Front Yard\n";
	for(my $i = 0; $i < $cLength; $i++)
	{
		print $i+1 . ") $zoneC[$i]\n";
	}
	print "\nD: Grandma's Middle Walkway\n";
	for(my $i = 0; $i < $dLength; $i++)
	{
		print $i+1 . ") $zoneD[$i]\n";
	}
	print "\nE: Sletta's Front Yard/Porch\n";
	for(my $i = 0; $i < $eLength; $i++)
	{
		print $i+1 . ") $zoneE[$i]\n";
	}
	print "\nF: Sletta's Side Yard\n";
	for(my $i = 0; $i < $fLength; $i++)
	{
		print $i+1 . ") $zoneF[$i]\n";
	}
	print "\nG: Sletta's Middle Walkway\n";
	for(my $i = 0; $i < $gLength; $i++)
	{
		print $i+1 . ") $zoneG[$i]\n";
	}
	print "\nH: Backyard\n";
	for(my $i = 0; $i < $hLength; $i++)
	{
		print $i+1 . ") $zoneH[$i]\n";
	}
	print "\nTotal eggs: $egg_count\n\n\n";
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
	chomp($zone = <>);
	while((looks_like_number($zone)) || ((lc($zone) ne 'a') && (lc($zone) ne 'b') && (lc($zone) ne 'c') && (lc($zone) ne 'd') && (lc($zone) ne 'e') && (lc($zone) ne 'f') && (lc($zone) ne 'g') && (lc($zone) ne 'h')))
	{
		print "Invalid!\n";
		chomp($zone = <>);
	}
	cls();
	if(lc($zone) eq 'a')
	{
		print colored ['bold cyan'], "A: Grandma's Back Porch\n";
		for(my $i = 0; $i < $aLength; $i++)
		{
			print $i+1 . ") $zoneA[$i]\n";
		}
	}
	elsif(lc($zone) eq 'b')
	{
		print "\nB: Grandma's Side Lawn\n";
		for(my $i = 0; $i < $bLength; $i++)
		{
			print $i+1 . ") $zoneB[$i]\n";
		}
	}
	elsif(lc($zone) eq 'c')
	{
		print "\nC: Grandma's Front Yard\n";
		for(my $i = 0; $i < $cLength; $i++)
		{
			print $i+1 . ") $zoneC[$i]\n";
		}
	}
	elsif(lc($zone) eq 'd')
	{
		print "\nD: Grandma's Middle Walkway\n";
		for(my $i = 0; $i < $dLength; $i++)
		{
			print $i+1 . ") $zoneD[$i]\n";
		}
	}
	elsif(lc($zone) eq 'e')
	{
		print "\nE: Sletta's Front Yard/Porch\n";
		for(my $i = 0; $i < $eLength; $i++)
		{
			print $i+1 . ") $zoneE[$i]\n";
		}
	}
	elsif(lc($zone) eq 'f')
	{
		print "\nF: Sletta's Side Yard\n";
		for(my $i = 0; $i < $fLength; $i++)
		{
			print $i+1 . ") $zoneF[$i]\n";
		}
	}
	elsif(lc($zone) eq 'g')
	{
		print "\nG: Sletta's Middle Walkway\n";
		for(my $i = 0; $i < $gLength; $i++)
		{
			print $i+1 . ") $zoneG[$i]\n";
		}
	}
	else
	{
		print "\nH: Backyard\n";
		for(my $i = 0; $i < $hLength; $i++)
		{
			print $i+1 . ") $zoneH[$i]\n";
		}
	}
	pause($p=>"\nPress any key to return to the main menu");
	main_menu();
}
sub admin_menu
{
	$was_egg_added = 0;
	cls();
	print "Administrator Menu\n
Add eggs:
1) Manually
2) From File
3) Return to main menu

Enter selection: ";
	chomp(my $option2 = <>);
	while(!(looks_like_number($option2)) || ($option2 < 1) || ($option2 > 3))
	{
		print "\"$option2\" is not a valid selection. Please select an option numbered 1-6.\n";
		chomp($option2 = <>);
	}
	if($option2 == 1)
	{
		cls();
		manualEnter();
	}
	elsif($option2 == 2)
	{
		countdown($t=>5, $m=>"Importing eggs from a file will be implemented in a future version. Returning to main menu in ** seconds.", $s1=>"seconds", $s2=>"second");
		main_menu();
	}
	else
	{
		main_menu();
	}
}

#----------Admin Menu Funtions------------#
sub manualEnter
{
	display_map();
	print "Enter the zone and description of the eggs\n";
	print "Use the following syntax: ";
	print colored ['bold yellow'], " zone#\\description\n\n";
	textColor("Reset");
	print "Add (o)ne egg, or (m)ultiple eggs?\n";
	chomp(my $to_input = <>);
	
	while(lc($to_input) ne 'o' && lc($to_input) ne 'm')
	{
		print colored ['bold red'], "Please enter 'o' for one egg, or 'm' for multiple.\n";
		chomp($to_input = <>);
	}
	my $number_of_loops;
	if(lc($to_input) eq 'o')
	{
		$number_of_loops = 1;
		egg_input();
		display_map();
		print "Enter the zone and description of the eggs\n";
		print "Use the following syntax: ";
		print colored ['bold yellow'], " zone#\\description\n\n";
		textColor("Reset");
		print colored ['bold green'], "Egg Added!\n";
		sleep(1.5);
		pause($p=>"Press any key to return to the Admin menu.");
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
		admin_menu();
	}
}
sub egg_input
{
	my $badZone = 0;
	my $badSyntax = 0;
	my $altBadSyntax = 0;
	display_map();
	print "Enter the zone and description of the eggs\n";
	print "Use the following syntax: ";
	print colored ['bold yellow'], " zone#\\description\n\n";
	textColor("Reset");
	if($was_egg_added == 1)
	{
		print colored ['bold green'], "Egg Added!\n";
		sleep(1.5);
		display_map();
		print "Enter the zone and description of the eggs\n";
		print "Use the following syntax: ";
		print colored ['bold yellow'], " zone#\\description\n\n";
		textColor("Reset");
	}
	print "Input: ";
	chomp(my $input = <>);
	my $char = "\\";
	my $result = index($input, $char);
	my $first = substr($input, 0, 1);
	if($result != 1)
	{
		if(lc($input) eq 'done')
		{
			pause($p=>"Done adding eggs. Press any key to return to admin menu.\n");
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
		print colored ['bold yellow'], " zone#\\description\n\n";
		textColor("Reset");
		print "Input: ";
		chomp($input = <>);
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
	my $current_egg;
	my $egg_descript;
	$egg_count = $egg_count + 1;
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
1;