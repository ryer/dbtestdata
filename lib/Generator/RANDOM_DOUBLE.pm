package Generator;

use warnings;
use strict;

##
# Type: Generator
# Synopsis: Float.
#
# RANDOM_DOUBLE(20)
#   => '15.231'
# RANDOM_DOUBLE(100, 40)
#   => '98.8861'
##
sub RANDOM_DOUBLE {
    my ($max, $min) = @_;

    if (!defined $min) {
        $min = 1.0;
    }

    return {
        "type" => 'RANDOM_DOUBLE',
        "gen"  => sub {
            return rand($max + 1 - $min) + $min;
        }
    };
}

1;
