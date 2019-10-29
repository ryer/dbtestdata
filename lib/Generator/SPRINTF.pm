package Generator;

use strict;
use warnings;

##
# Type: Formatter
# Synopsis: Like sprintf.
#
# SPRINTF("%8s/%0.2f", RANDOM_ALPHA(8, 2), RANDOM_DOUBLE(99))
#   => '  uXkass/27.28'
##
sub SPRINTF {
    my ($format, @generators) = @_;
    @generators = map {literal_boxing($_)} @generators;

    return {
        "type" => 'SPRINTF',
        "gen"  => sub {
            my @values;
            foreach my $it (@generators) {
                push(@values, $it->{'gen'}->(@_));
            }
            return sprintf($format, @values);
        }
    };
}

1;
