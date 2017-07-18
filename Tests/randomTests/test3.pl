#!/usr/bin/perl -w
use warnings;
use strict;
use Cwd;
use Win32::Console::ANSI;
use Term::ANSIColor;
use Try::Tiny;

=comment
my $command = "pp -o bob.exe thefile.pl";
`$command`;
print STDERR "It didnt work!";
`pause`;
=cut

=comment
my $command = "pp -o thebob.exe test2.pl";

eval { my $answer = `$command` }; 
warn $@ if $@;
print "$@ = " . '$@';

if($@)
{
	print "didnt work";
}
else
{
	print "oh hey it worked";
}
`pause`;
=cut
my $path = "c:/perl/tests/test2.pl";
my $command = "pp -o theblob.exe $path";
`$command`;

if(-e $path)
{
	print "It worked! now exiting";
}
else
{
	print "Didnt work... now exiting";
}

`pause`;


=comment
try
{
	`$command`;
	die "foo";
	
};
catch
{
	print "try again";
	"Bar"
}
`pause`;
=cut
