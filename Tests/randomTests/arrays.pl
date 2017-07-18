#!/usr/bin/perl -w
use warnings;
use strict;

=comment
my @people =  ( [ "bob", "jim", "joe" ],
				[ "Sally", "sammi", "torie", "janice"], 
				[ "mom", "dad", "sister" ] );

print "Print Using ForEach\n";
foreach my $row(@people)
{
   foreach my $val(@$row)
   {
      print "$val ";
   }
   print "\n";
}


my @array = (
"1: Under big tree",
"2: Flower Pot",
"3: Egg Tree",
"4: Window near AC",
"5: Blue tarp"
);
foreach my $val(@array)
{
	print "$val\n";
}
print "\nSelect one to remove: ";
chomp(my $sel = <>);
my @newArray = splice @array, $sel-1, 1;

foreach my $val(@array)
{
	print "$val\n";
}

#print "\@array = (@array)\n";
#print "\@newArray = (@newArray)\n";
=cut

=c
my $string = "A::Under the flower pot";
my @newString = split(/::/, $string);
print $newString[0] . "\n";
print $newString[1] . "\n";
print "$newString[0]\\$newString[1]";
#print $string[0];

my $myPath = "A::Under the flower pot"; # Example string containing backslashes
print "\nOriginal string is: $myPath\n\n";
# The following command replaces forward slashes with backslashes
# You need to escape the backslash and slash with backslashes
$myPath =~ s/::/\\/g; #There must be a better way, but I don't know it.
print "Modified string is: $myPath\n";
=cut

my $string = "A\Under the Porch";
my $first = substr($string, 0, 1);
print $first;

=comment2
my @newString = split(/\\/, $string);
foreach my $val(@newString)
{
	print "$val\n";
}
=cut
system("pause");

#   s/\// \\/g