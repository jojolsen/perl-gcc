#!/usr/bin/perl -w
use warnings;
use strict;


`title .pl to .exe packer`;

print 'In which directory is the .pl file located (Use backslashes): ';
chomp(my $perlLoca = <>);
print 'Where do you want to save the .exe file (For same as above, keep blank): ';
chomp(my $exeLoca = <>);

unless($perlLoca=~/\\$/)
{ 
	$perlLoca = $perlLoca . "\\";
}

if($exeLoca eq "")
{
	$exeLoca = $perlLoca;
}
else
{
	unless($exeLoca=~/\\$/)
	{ 
		$exeLoca = $exeLoca . "\\";
	}
}
print "Name of .pl file: ";
chomp(my $perlFile = <>);
print "Name of new .exe file: ";
chomp(my $exeFile = <>);

unless($perlFile=~/.pl$/)
{ 
	$perlFile = $perlFile . ".pl";
}
unless($exeFile=~/.exe$/)
{ 
	$exeFile = $exeFile . ".exe";
}

my $thePlFile = $perlLoca . $perlFile;
my $theExeFile = $exeLoca . $exeFile;



my $command = "pp -o \"$theExeFile\" \"$thePlFile\"";
print "Running... $command\n";

my $test = eval(`$command`);
if(!$test)
{
	print "Now exiting...";
	`pause`;

}
