
#vars
my @terms;
my @defs;
my @wholeSet;
my $term;
my $def;
my $termsSize;

#begin program
sub begin_program
{
	my $termsSize = @terms;
	print "Flashcards Program ver. 1\nThere are currently $termsSize cards. What would you like to do?
1) Import set
2) Use current set
3) Create a new set

Select number: ";
	my $menuChoice = <>;
	if($menuChoice == 1)
	{
		print "Enter the name of the set you wish to import: ";
		chomp(my $toImport = <>);
		eval {import_set($toImport)}; warn $@ if $@;
	}
	elsif($menuChoice == 2)
	{
		print "Using current set\n";
	}
	elsif($menuChoice == 3)
	{
		print "Enter the name of the new set: ";
		chomp(my $setName = <>);
		eval {create_set($setName)}; warn $@ if $@;
	}
	else
	{
		print "Invalid selection.\n";
	}
}


sub import_set
{
	my ($nameOfSet) = @_;
	my @tempArray;
	my $file = $nameOfSet . ".txt";
	open iFILE, "<$file" or die $!;
	while (<iFILE>)
	{
		my $line = $_;
		#print $line;
		
		@tempArray = split("::", $line);
		$term = $tempArray[0];
		$def = $tempArray[1];
		chomp($term);
		chomp($def);
		push(@terms, "$term");
		push(@defs, "$def");
		undef @tempArray;
	}
	my $terms = @terms;
	@wholeSet = (\@terms, \@defs);
	system("cls");
	print "$nameOfSet Imported.\n";
	#begin_program();
	
#=view cards
	for(my $i = 0; $i < $terms; $i++)
	{
		for(my $j = 0; $j < 2; $j++)
		{
			if($j/1 == 0)
			{
				print "$wholeSet[$j][$i]::";
			}
			else
			{
				print "$wholeSet[$j][$i]";
			}
			
			#`pause`;
		}
		print "\n";
	}
#=cut

	
	
	close iFILE;
	#open oFILE, ">$nameOfSet" or die $!;
	
	
}

sub create_set
{
	my ($nameOfSet) = @_;
	my $file = $nameOfSet . ".txt";
	open cFILE, ">$file" or die $!;
	my $continue = "y";
	while ($continue eq "y")
	{
		#my ($term, $def);
		system("cls");
		print "Set: $nameOfSet\n\n";
		print "Term:\n";
		chomp($term = <>);
		print "\nDefinition:\n";
		chomp($def = <>);
		push(@terms, $term);
		push(@defs, $def);
		print cFILE $term . "::" . $def . "\n";
		print "\nAdd another term? (y/n) ";
		chomp($continue = <>);
		$continue = lc($continue);
	}
	close cFILE;
}
1;