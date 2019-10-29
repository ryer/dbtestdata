package Generator;

use warnings;
use strict;

##
# Type: Generator
# Synopsis: Japanese telephone number.
#
# RANDOM_JP_TEL()
#   => '029-5881-3882'
##
sub RANDOM_JP_TEL {

    return {
        "type" => 'RANDOM_JP_TEL',
        "gen"  => sub {
            return sprintf("0%02d-%04d-%04d",
                int rand 100,
                int rand 10000,
                int rand 10000
            );
        }
    };
}

1;
