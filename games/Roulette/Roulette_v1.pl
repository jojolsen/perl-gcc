#///   Roulette Ver. 1.0    ///#
#/// Author: Josiah Dunham  ///#
#///   Date: April, 2013	///#


# If the credit < min amount, auto spins if user selects to spin again.
#### Needs to offer to spin again ONLY if the user has a sufficient credit
# Fix first bet problem

#!/usr/bin/perl -w
use warnings;
use strict;
use Cwd;
use Win32::Console::ANSI;
use Term::ANSIColor;
use Scalar::Util qw(looks_like_number);
use Term::ReadKey;
use Time::HiRes qw(usleep);
#system("color 1F");
#///Variables///#
my $p = "phrase";
my $correct = 0;
my $score = 0;
my $credit = 100;
my @wheel = qw(0 28 9 26 30 11 7 20 32 17 5 22 34 15 3 24 36 13 1 00 27 10 25 29 12 8 19 31 18 6 21 33 16 4 23 35 14 2);
my @colors = qw(g b r b r b r b r b r b r b r b r b r g r b r b r b r b r b r b r b r b r b);
my @bets;
my @betStrings;
my $totalBets = @bets;
my @amounts;
my $totalAmounts = @amounts;
my $totalNumbers = @wheel;
my $SLEEP_TIME = int(rand(10000) + 45000);
my $numOfSpins = rand(1) + 1;
my $color;
my $displayColor;
my $green = "white on_green";
my $black = "white on_black";
my $red = "white on_red";
my $bet = 0;
my $betString;
my $amount = 0;
my $payoff;
my $result;
my $winner = 0;
my @results;
my $newMoney = 0;
my $minBet = 20;
my $quit = 0;


#///--------------------------Program Start--------------------------///#
do
{
	$winner = 0;
	$bet = 0;
	@betStrings = ();
	@amounts = ();
	@bets = ();
	@results = ();
	display_board();
	place_outside_bet();
	spin_wheel();
	#cls();
	if($credit < $minBet)
	{
		print "You currently have \$$credit. You do not have enought credit to keep playing.\nPlease insert more credit, or come back later.\n";
		print "1) Insert credit\n2) Quit\n";
		my $select = textIn();
		if($select == 1)
		{
			insert_credit();
		}
		else
		{
			cls();
			print "Now exiting...\n";
			sleep(2);
			exit;
		}
	}
	print "Available Credit: \$$credit. Spin again?\n1) Yes\n2) No\n";
	$quit = textIn();
	cls();
} while($quit == 1);

#///--------------------------Program End----------------------------///#

#///Functions///#
sub spin_wheel
{
	my $SLEEP_TIME = int(rand(10000) + 45000);
	my $startingNumber = int(rand(38));
	my $mult = 2000;
	for(my $i = 0; $i < $totalNumbers*$numOfSpins; $i++)
	{
		system("cls");
		if($colors[$startingNumber] eq 'b')
		{
			$color = "black on_white";
			$displayColor = "Black";
		}
		elsif($colors[$startingNumber] eq 'r')
		{
			$color = "bold red on_white";
			$displayColor = "Ged";
		}
		elsif($colors[$startingNumber] eq 'g')
		{
			$color = "green on_white";
			$displayColor = "Green";
		}
		print "Your bets were:\n";
		for(my $r = 0; $r < $totalBets; $r++)
		{
			print "$betStrings[$r]: \$$amounts[$r]\n";
		}
		print "Wheel spinning... ";
		if($wheel[$startingNumber] < 10)
		{
			print colored [$color], "$wheel[$startingNumber] \n";
		}
		else
		{
			print colored [$color], "$wheel[$startingNumber]\n";
		}
		if($startingNumber == 37)
		{
			$startingNumber = 0;
		}
		else
		{
			$startingNumber++;
		}
		usleep($SLEEP_TIME);
	}
	for(my $i = 0; $i < 23; $i++)
	{
		system("cls");
		if($colors[$startingNumber] eq 'b')
		{
			$color = "black on_white";
			$displayColor = "Black";
		}
		elsif($colors[$startingNumber] eq 'r')
		{
			$color = "bold red on_white";
			$displayColor = "Red";
		}
		elsif($colors[$startingNumber] eq 'g')
		{
			$color = "green on_white";
			$displayColor = "Green";
		}
		print "Your bets were:\n";
		for(my $r = 0; $r < $totalBets; $r++)
		{
			print "$betStrings[$r]: \$$amounts[$r]\n";
		}
		print "Wheel spinning... ";
		if($wheel[$startingNumber] < 10)
		{
			print colored [$color], "$wheel[$startingNumber] \n";
		}
		else
		{
			print colored [$color], "$wheel[$startingNumber]\n";
		}
		
		if($startingNumber == 37)
		{
			$startingNumber = 0;
		}
		else
		{
			$startingNumber++;
		}
		
		$mult = $mult*1.2;
		$SLEEP_TIME = $SLEEP_TIME + $mult;
		usleep($SLEEP_TIME);
	}
	display_board();
	$result = $wheel[$startingNumber-1];
	#$result = $wheel[0];
	print "\n$result $displayColor!\n";
	if(($result eq '00') || $result == 0)
	{
		print "Everybody loses!\n";
	}
	else
	{
		calculate_payoff();
	}
}
sub place_outside_bet
{
	my $resultString;
	while($bet != 10)
	{	
		bet_menu();
		
		if($credit < $minBet)
		{
			return;
		}
		print "Where would you like to bet? ";
		$bet = textIn();
		if($bet == 10)
		{
			if($totalBets == 0)
			{
				while($bet == 10)
				{
					#bet_menu();
					print "You must enter at least one bet!\n";
					print "Where would you like to bet? ";
					$bet = textIn();
				}
			}
			else
			{
				return;
			}
		}
		print "How much? ";
		$amount = textIn();
		while(($credit - $amount < 0) || ($amount < $minBet))
		{
			if($credit < $amount)
			{
				print "Insufficient credit. Please make another bet.\n";
			}
			elsif($amount < $minBet)
			{
				print "The Minimum bet is \$$minBet. Please make another bet.\n";
			}
			print "How much? ";
			$amount = textIn();
		}
		$credit = $credit - $amount;
		if($bet == 1)
		{
			$betString = "1-18";
			
		}
		elsif($bet == 2)
		{
			$betString = "1st 12";
		}
		elsif($bet == 3)
		{
			$betString = "Even";
		}
		elsif($bet == 4)
		{
			$betString = "Red";
		}
		elsif($bet == 5)
		{
			$betString = "2nd 12";
		}
		elsif($bet == 6)
		{
			$betString = "Black";
		}
		elsif($bet == 7)
		{
			$betString = "Odd";
		}
		elsif($bet == 8)
		{
			$betString = "3rd 12";
			
		}
		elsif($bet == 9)
		{
			$betString = "19-36";
		}
		push(@bets, $bet);
		push(@betStrings, $betString);
		push(@amounts, $amount);
		$totalBets = @bets;
		$totalAmounts = @amounts;			
	}
}
sub bet_menu
{
	cls();
	display_board();
	print "Available Credit: \$$credit\nPlace outside bets:
1)  1-18 (1:1)
2)  1st 12 (2:1)
3)  Even (1:1)
4)  Red (1:1)
5)  2nd 12 (2:1)
6)  Black (1:1)
7)  Odd (1:1)
8)  3rd 12 (2:1)
9)  19-36 (1:1)
10) Finish placing bets
";
}
sub calculate_payoff
{
	my $theBet;
	$newMoney = 0;
	my $resultString;
	for(my $t = 0; $t < $totalBets; $t++)
	{
		$winner = 0;
		$theBet = $bets[$t];
		if($theBet == 1)
		{
			$payoff = 1;
			if(($result > 0) && ($result <= 18))
			{
				$winner = 1;
			}
			else
			{
				$winner = 0;
			}
		}
		elsif($theBet == 2)
		{
			$payoff = 2;
			if(($result > 0) && ($result <= 12))
			{
				$winner = 1;
			}
			else
			{
				$winner = 0;
			}
		}
		elsif($theBet == 3)
		{
			$payoff = 1;
			if($result %2 == 0)
			{
				$winner = 1;
			}
			else
			{
				$winner = 0;
			}
		}
		elsif($theBet == 4)
		{
			$payoff = 1;
			if($displayColor eq "Red")
			{
				$winner = 1;
			}
			else
			{
				$winner = 0;
			}
		}
		elsif($theBet == 5)
		{
			$payoff = 2;
			if(($result > 12) && ($result <= 24))
			{
				$winner = 1;
			}
			else
			{
				$winner = 0;
			}
		}
		elsif($theBet == 6)
		{
			$payoff = 1;
			if($displayColor eq "Black")
			{
				$winner = 1;
			}
			else
			{
				$winner = 0;
			}
			
		}
		elsif($theBet == 7)
		{
			$payoff = 1;
			if($result % 2 != 0)
			{
				$winner = 1;
			}
			else
			{
				$winner = 0;
			}
		}
		elsif($theBet == 8)
		{
			$payoff = 2;
			if(($result > 24) && ($result <= 36))
			{
				$winner = 1;
			}
			else
			{
				$winner = 0;
			}
		}
		elsif($theBet == 9)
		{
			$payoff = 1;
			if($result >= 19)
			{
				$winner = 1;
			}
			else
			{
				$winner = 0;
			}
		}
		
		if($winner == 1)
		{
			$resultString = "Bet Made!";
			$newMoney = $newMoney + ($amounts[$t] + ($amounts[$t] * $payoff));
		}
		else
		{
			$resultString = "Bet Lost.";
		}
		push(@results, $resultString);
	}
	for(my $d = 0; $d < $totalBets; $d++)
	{
		print "$betStrings[$d]: $results[$d]\n";
	}
	$credit = $credit + $newMoney;
	print "New available balance: $credit\n";
}
sub insert_credit
{

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

#///Draw Board///#
sub display_board
{
	print colored [$green], "
	+----------+---------+
        |    0     |    00   |
        +------+------+------+
        |";
print colored [$red], "   1  ";
print colored [$green], "|";
print colored [$black], "   2  ";
print colored [$green], "|";
print colored [$red], "   3  ";
print colored [$green], "|
 1-18   +------+------+------+
        |";
print colored [$black], "   4  ";
print colored [$green], "|";
print colored [$red], "   5  ";
print colored [$green], "|";
print colored [$black], "   6  ";
print colored [$green], "|
 1st 12 +------+------+------+
        |";
print colored [$red], "   7  ";
print colored [$green], "|";
print colored [$black], "   8  ";
print colored [$green], "|";
print colored [$red], "   9  ";
print colored [$green], "|
 Even   +------+------+------+
        |";
print colored [$black], "  10  ";
print colored [$green], "|";
print colored [$black], "  11  ";
print colored [$green], "|";
print colored [$red], "  12  ";
print colored [$green], "|
        +------+------+------+
        |";
print colored [$black], "  13  ";
print colored [$green], "|";
print colored [$red], "  14  ";
print colored [$green], "|";
print colored [$black], "  15  ";
print colored [$green], "|
 Red    +------+------+------+
        |";
print colored [$red], "  16  ";
print colored [$green], "|";
print colored [$black], "  17  ";
print colored [$green], "|";
print colored [$red], "  18  ";
print colored [$green], "|
 2nd 12 +------+------+------+
        |";
print colored [$red], "  19  ";
print colored [$green], "|";
print colored [$black], "  20  ";
print colored [$green], "|";
print colored [$red], "  21  ";
print colored [$green], "|
 Black  +------+------+------+
        |";
print colored [$black], "  22  ";
print colored [$green], "|";
print colored [$red], "  23  ";
print colored [$green], "|";
print colored [$black], "  24  ";
print colored [$green], "|
        +------+------+------+
        |";
print colored [$red], "  25  ";
print colored [$green], "|";
print colored [$black], "  26  ";
print colored [$green], "|";
print colored [$red], "  27  ";
print colored [$green], "|
 Odd    +------+------+------+
        |";
print colored [$black], "  28  ";
print colored [$green], "|";
print colored [$black], "  29  ";
print colored [$green], "|";
print colored [$red], "  30  ";
print colored [$green], "|
 3rd 12 +------+------+------+
        |";
print colored [$black], "  31  ";
print colored [$green], "|";
print colored [$red], "  32  ";
print colored [$green], "|";
print colored [$black], "  33  ";
print colored [$green], "|
 19-36  +------+------+------+
        |";
print colored [$red], "  34  ";
print colored [$green], "|";
print colored [$black], "  35  ";
print colored [$green], "|";
print colored [$red], "  36  ";
print colored [$green], "|
        +------+------+------+

";
}