#-------File:	Easter Eggs-Main Page----#
#-------Author:	Josiah Dunham------------#
#-------Date:	April, 2013--------------#

#!/usr/bin/perl -w
use warnings;
use strict;
use Cwd;
use Win32::Console::ANSI;
use Term::ANSIColor;
use Scalar::Util qw(looks_like_number);
use Term::ReadKey;


require 'EasterEggs_Functions.pl';


main_menu();

`pause`;