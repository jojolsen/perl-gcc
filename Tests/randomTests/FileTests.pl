#!/usr/bin/perl -w
use warnings;
use strict;
use Cwd;
use Win32::Console::ANSI;
use Term::ANSIColor;
use Scalar::Util qw(looks_like_number);

=comment
printf("'%30s'\n", "Hello");
printf("'%10s'\n", "Hello");
printf("'%-30s'\n", "Hello");

=cut

open FILE, ">aFile.txt" or die $!;
my $table = "Hello, World!";
print FILE $table;
close FILE;
open FILE, "<aFile.txt" or die $!;
while (<FILE>)
{
	my $line = $_;
	print "$line";
}
close FILE;
#while (<FILE>)
#{
#	my $line = $_;
#	print "$line";
#}

`pause`;

=line by line example
open(MYINPUTFILE, "<filename.out");
while(<MYINPUTFILE>)
 {
 # Good practice to store $_ value because
 # subsequent operations may change it.
 my($line) = $_;

 # Good practice to always strip the trailing
 # newline from the line.
 chomp($line);

 # Convert the line to upper case.
 $line =~ tr/[a-z]/[A-Z]/;

 # Print the line to the screen and add a newline
 print "$line\n";
 }
 =cut
 #-------------------#
 =all at once file example
 open(MYINPUTFILE, "<filename.out"); # open for input
my(@lines) = <MYINPUTFILE>; # read file into list
@lines = sort(@lines); # sort the list
my($line);
foreach $line (@lines) # loop thru list
 {
 print "$line"; # print in sort order
 }
close(MYINPUTFILE);
=cut