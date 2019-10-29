#! perl --

use strict;
use warnings;
use File::Basename;

my $doc = {};
foreach my $f (sort glob(dirname(__FILE__) . "/*.pm")) {
    open(PM, $f) or die($!);
    my $current;
    my $example;
    while (my $line = <PM>) {
        if ($line =~ m/^# Type: (.+)/) {
            my $type = $1;
            $current = {
                type     => $type,
                synopsis => undef,
                name     => undef,
                examples => []
            };
            push(@{$doc->{$type}}, $current);
        }
        if ($line =~ m/^# Synopsis: (.+)/) {
            $current->{'synopsis'} = $1;
        }
        elsif ($line =~ m/^# ([_A-Z]+)(\(.+)/) {
            $current->{'name'} = $1;
            $example = $1 . $2;
        }
        elsif ($line =~ m/^#   => (.+)/) {
            my $returns = $1;
            push(@{$current->{'examples'}}, { example => $example, returns => $returns });
            undef $example;
        }
    }
}

print "# GENERATOR FUNCTIONS\n";
print "\n";

foreach my $type (sort keys(%$doc)) {
    print "## $type\n";
    print "\n";

    foreach my $it (@{$doc->{$type}}) {
        print "#### " . $it->{'name'} . "\n";
        print "\n";

        print $it->{'synopsis'} . "\n";
        print "\n";

        print "| Example | Returns |\n";
        print "| ------- | ------- |\n";

        foreach my $e (@{$it->{'examples'}}) {
            my $example = $e->{'example'};
            my $returns = $e->{'returns'};
            print "| `$example` | `$returns` |\n";
        }

        print "\n";
    }
}
