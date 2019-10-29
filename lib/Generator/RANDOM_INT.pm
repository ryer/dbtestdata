package Generator;

use warnings;
use strict;

##
# Type: Generator
# Synopsis: Integer.
#
# RANDOM_INT(20)
#   => '15'
# RANDOM_INT(100, 40)
#   => '98'
##
sub RANDOM_INT {
    my ($max, $min) = @_;

    my $genDouble = RANDOM_DOUBLE($max, $min)->{'gen'};

    return {
        "type" => 'RANDOM_INT',
        "gen"  => sub {
            return int $genDouble->(@_);
        }
    };
}

1;
