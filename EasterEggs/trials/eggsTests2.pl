# lib/A/Module.pm
package A::Module;
use Sub::Exporter -setup => {
    exports => [ qw/textIn/ ],
};

sub textIn
{
	print color "bold cyan";
	chomp(my $text = <>);
	return $text;
}

1;