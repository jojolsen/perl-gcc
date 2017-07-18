#!/usr/bin/perl -w
use warnings;
use strict;
use Cwd;
use Win32::Console::ANSI;
use Term::ANSIColor;

`title .pl to .exe packer`;

#gets the current working directory
my $perlLoca = getcwd;
#print color 'blue';
#print colored ['bold red'], "This text is bold red.\n";
print "Current directory: ";
print colored['bold yellow'], "$perlLoca\n\n";

#prompts the user where the pl file to be packed is, and where they want to save it
print "In which directory is the .pl file located";
print colored['bold blue'], "\n(Use forward slashes. To keep the same path as current, press enter)\n";
chomp($perlLoca = <>);
print "Where do you want to save the .exe file\n";
print colored['bold blue'], "(For same as above, keep blank)\n";
chomp(my $exeLoca = <>);

#if the path where the file is located is left empty, they want to save it in the current working directory
if($perlLoca eq "")
{
	$perlLoca = getcwd;
}
#if there is no '/' at the end of the location, add one
unless($perlLoca=~m(//$/))
{ 
	$perlLoca = $perlLoca . "/";
}
#if the location where the user wants to save the file is left blank, new file location = location of pl file
if($exeLoca eq "")
{
	$exeLoca = $perlLoca;
}
#if new location is specified, check for a '/' at the end of what the user inputted, and add one if it is not there
else
{
	unless($exeLoca=~m(//$/))
	{ 
		$exeLoca = $exeLoca . "/";
	}
}

#prompts the user for name of both existing pl file, and new exe file to be created
print "Name of .pl file: ";
chomp(my $perlFile = <>);
print "New name of new .exe file: ";
chomp(my $exeFile = <>);

#if there is not a .pl at the end of the file name, add it
unless($perlFile=~/.pl$/)
{ 
	$perlFile = $perlFile . ".pl";
}

#tests to see if the new exe file is blank - if it is, assign it a default file name
if($exeFile eq "")
{
	$exeFile = "New File.exe";
}

#if there is not a .exe at the end of teh file name, add it
unless($exeFile=~/.exe$/)
{ 
	$exeFile = $exeFile . ".exe";
}

#create an entire path with the locations and file names
my $thePlFile = $perlLoca . $perlFile;
my $theExeFile = $exeLoca . $exeFile;


#execute command
my $command = "pp -o \"$theExeFile\" \"$thePlFile\"";
print colored['bold blue'], "Running... $command\n";

#test to check if there were any errors
`$command 2>error.txt`;
if(-e $thePlFile)
{
	print colored['bold green'], "\nSuccess!\n";
	print "Now exiting...";
	`pause`;
	

}
else
{
	print colored['bold red'], "\nPacking failed.\n";
	print "Now exiting...";
	`pause`;
}
