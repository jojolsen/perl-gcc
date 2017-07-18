#!/usr/bin/perl -w
use warnings;
use strict;
use Cwd;
use Win32::Console::ANSI;
use Term::ANSIColor;

`title .pl to .exe packer`;

#gets the current working directory
my $perlLoca = getcwd;
print "Current directory: ";
print colored['bold yellow'], "$perlLoca\n\n";


#prompts the user where the pl file to be packed is, and where they want to save it
print "In which directory is the .pl file located";
print colored['bold blue'], "\n(Use forward slashes. To keep the same path as current, press enter)\n";
print color 'bold cyan';
chomp($perlLoca = <>);
print color 'reset';
print "Where do you want to save the .exe file\n";
print colored['bold blue'], "(For same as above, keep blank)\n";
print color 'bold cyan';
chomp(my $exeLoca = <>);
print color 'reset';

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
print "Name of existing .pl file\n";
print color 'bold cyan';
chomp(my $perlFile = <>);
print color 'reset';
print "New name of new .exe file\n";
print colored['bold blue'], "(Too keep the same name is perl file, simply press enter)\n";
print color 'bold cyan';
chomp(my $exeFile = <>);
print color 'reset';

#if there is not a .pl at the end of the file name, add it
unless($perlFile=~/.pl$/)
{ 
	$perlFile = $perlFile . ".pl";
}
my $len = length($perlFile);
#take off the .pl to allow for naming the exe file the same as the pl file
my $loseExt = substr($perlFile, 0, $len-3);

#tests to see if the new exe file is blank - if it is, assign it same name as pl file
if($exeFile eq "")
{
	$exeFile = "$loseExt" . ".exe";
}

#if there is not a .exe at the end of thh file name, add it
unless($exeFile=~/.exe$/)
{ 
	$exeFile = $exeFile . ".exe";
}

#create an entire path with the locations and file names
my $thePlFile = $perlLoca . $perlFile;
my $theExeFile = $exeLoca . $exeFile;


#execute command
my $command = "pp -o \"$theExeFile\" \"$thePlFile\"";
print colored['bold white on_blue'], "Running... $command\n";
my $createOpt;
#my $destError = "Destination path: " . $exeLoca . " does not exist.";
my $errorFile = $loseExt . "Error.txt";
if(!-d $exeLoca)
{
	print colored['bold red'], "Destination directory does not exist.\n";
	print "Would you like to create it? (y/n) ";
	print color 'bold cyan';
	chomp($createOpt = <>);
	print color 'reset';
	if(lc($createOpt) eq "n")
	{
		print "Press enter to exit...";
		`pause`;
		exit;
	}
	elsif(lc($createOpt) eq "y")
	{
		goto COMMAND;
	}
	else
	{
		print "Invalid input. Press enter to exit...";
		`pause`;
		exit;
	}
	
}

#test to check if there were any errors
COMMAND:

`$command 2>"$errorFile"`;
if(-z $errorFile)
{
	unlink $errorFile;
}

#`$command`;

if(-e $thePlFile)
{
	print colored['bold green'], "\nSuccess!\n";
	print "Press enter to exit...";
	`pause`;
	

}
else
{
	print colored['bold red'], "\nPacking failed. See " . $errorFile . " for details.\n";
	print "Press enter to exit...";
	`pause`;
}
