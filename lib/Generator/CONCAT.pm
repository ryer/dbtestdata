package Generator;

use strict;
use warnings;

##
# Type: Formatter
# Synopsis: Join text.
#
# CONCAT(RANDOM_LITERAL('Sunny', 'Moon'), '/', RANDOM_INT(100))
#   => 'Moon/13'
##
sub CONCAT {
    my (@generators) = @_;
    @generators = map {literal_boxing($_)} @generators;

    return {
        "type" => 'CONCAT',
        "gen"  => sub {
            my $value = '';
            foreach my $it (@generators) {
                $value .= $it->{'gen'}->(@_);
            }
            return $value;
        }
    };
}

1;
