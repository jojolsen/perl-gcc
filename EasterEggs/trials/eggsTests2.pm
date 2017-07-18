# lib/ModuleName
package ModuleName;

BEGIN
sub textIn
{
	print color "bold cyan";
	chomp(my $text = <>);
	return $text;

}
END

1;