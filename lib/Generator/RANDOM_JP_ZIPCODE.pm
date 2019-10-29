package Generator;

use warnings;
use strict;

##
# Type: Generator
# Synopsis: Japanese zip code (Fake).
#
# RANDOM_JP_ZIPCODE()
#   => '224-0053'
##
sub RANDOM_JP_ZIPCODE {

    return {
        "type" => 'RANDOM_JP_ZIPCODE',
        "gen"  => sub {
            return sprintf("%03d-%04d",
                int rand 1000,
                int rand 10000
            );
        }
    };
}

1;
