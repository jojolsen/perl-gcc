#///HiOrLow program Ver. 1.0///#
#///Author: Josiah Dunham	///#
#///Date: April, 2013		///#

#!/usr/bin/perl -w
#system("mode CON: LINES=50 COLS=100");
use warnings;
use strict;
use Cwd;
use Win32::Console::ANSI;
use Term::ANSIColor;
use Scalar::Util qw(looks_like_number);
use Term::ReadKey;
use Time::HiRes qw(usleep);

#///Variables///#
my $p = "phrase";
my $random;
my $range = 15;
my $count = 0;
my $correct = 1;
my $score = 0;
my $numbers_size;
my @numbers;

#///Program Start///#
load_numbers(); #load numbers into the array
$numbers_size = @numbers; #get the size of the array
#Main menu text
print "Higher or Lower?\nWhen prompted, input a \"1\" if you think the next number will be Lower,\nor a \"2\" if you think it is Higher.\n\n";
print "Ready?\n";
pause($p=>"Press any key to begin!");
for(my $j = 0; $j < $numbers_size; $j++)
{
	cls();
	#print out the previous numbers
	for(my $i = 0; $i < $count+1; $i++)
	{
		print "$numbers[$i] ";
	}
	print "[\*]\n"; #print the number "face down"
	print "Lower or Higher? ";
	$count++; #increase how many numbers should be revealed
	my $input = textIn(); #get the users guess
	my $inString;
	if($input == 1)
	{
		$inString = "Lower";
	}
	else
	{
		$inString = "Higher";
	}
	cls();
	#print out the previous number, plus the newly revealed number
	for(my $i = 0; $i < $count+1; $i++)
	{
		print "$numbers[$i] ";
	}
	nl();
	print "You guessed $inString.\n\n";
	#checks to see if the user was correct or incorrect
	if($numbers[$count-1] > $numbers[$count]) #if the new number is greater than the previous number
	{
		if($input == 1)
		{
			$correct = 1; #if the user guessed higher, than they are correct
		}
		else
		{
			$correct = 0; #if the user guessed lower, than they are incorrect
		}
	}
	else #if the new number is less than the previous number
	{
		if($input == 1)
		{
			$correct = 0; #if the user guess higher, than they are incorrect
		}
		else
		{
			$correct = 1; #if the user guessed lower than they are correct
		}
	}
	#if the user was correct, add one to their score, and move on to the next number
	if($correct == 1)
	{
		print "Correct!";
		$score++;
	}
	#if the user was incorrect, call the game_over function and exit
	else
	{
		print "Incorrect.";
		game_over();
	}
	nl();
	pause($p=>"Press any key to guess the next number.\n");
}
nl();
pause();

#///Program End///#

#///Functions///#
sub load_numbers
{
	$random = int(rand($range)) + 1; #creates a random number between 1 and the range specified
	push(@numbers, $random); #push that number into the numbers array
	#finshes pushing numbers into the array and ensures no duplicates in the array
	for(my $i = 0; $i < $range-1; $i++) 
	{
		$random = int(rand($range)) + 1; #creates a new random number
		check($random); #checks that number with the whole array to see if it is already there
		push(@numbers, $random); #if that number is not already in the array, add it
	}
}
sub check
{
	my ($number) = @_;
	foreach my $test(@numbers)
	{
		#if the new random number is already in the array, create a new random, and re-call the check function and check that number
		if($test == $number)
		{
			$random = int(rand($range)) + 1;
			check($random);
		}
	}
}
sub game_over
{
	#prints out the users final score, and exits
	nl();
	print "Game over. Your final score was $score.\n";
	print "Now Exiting...";
	sleep(3);
	exit();
}

#///Technical Funtions///#
sub nl
{
	print "\n";
}
sub cls
{
	system("cls");
}
sub textIn
{
	chomp(my $text = <>);
	return $text;
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
	my $key = ReadKey(0);
	ReadMode('normal');
}