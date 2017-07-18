
#vars
my @courses;


#funtions

#main_menu
sub main_menu
{
	open OFILE, "<Current_courses.txt" or die $!;
	while (<OFILE>)
	{
		my $line = $_;
		push(@courses, "$line");
	}
	
	print "Grade Calculator v1\n\n";
	print "1) View Courses\n2) Add Courses\n3) Remove Courses\n\n";
	print "Select option: ";
	chomp(my $menu_option1 = <>);
	if(!(looks_like_number($menu_option1)))
	{
		print "Not a number\n";
		return;
	}
	if($menu_option1 == 1)
	{
		system("cls");
		view_courses();
	}
	elsif($menu_option1 == 2)
	{
		print "selected 2\n";
	}
	elsif($menu_option1 == 3)
	{
		print "selected 3\n";
	}
	else
	{
		print "Invalid selection\n";
	}
}

sub view_courses
{	
	my $n = 1;
	print "---Current Courses---\n";
	foreach my $lines (@courses)
	{
		print "$n) $lines";
		$n++;
	}
	print "\n\nSelect course: ";
	chomp(my $course_select = <>);
	if(!(looks_like_number($course_select)))
	{
		print "Not a number\n";
		return;
	}
	else
	{
		course_select($course_select);
	}
}

sub add_courses
{

}

sub remove_courses
{

}

sub course_select
{
	my ($course) = @_;
	print "You chose $courses[$course-1]";
}

1;