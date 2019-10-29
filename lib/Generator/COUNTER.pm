package Generator;

use strict;
use warnings;

##
# Type: Generator
# Synopsis: Magical increment.
#
# COUNTER()
#   => '1' => '1' => '2' ...
# COUNTER(0)
#   => '0' => '1' => '2' ...
# COUNTER('AA')
#   => 'AA' => 'AB' => 'AC' ...
##
sub COUNTER {
    my ($value) = @_;

    if (!defined $value) {
        $value = 1;
    }

    return {
        "type" => 'COUNTER',
        "gen"  => sub {
            return $value++;
        }
    };
}

1;
