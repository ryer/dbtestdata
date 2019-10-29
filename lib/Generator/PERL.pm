package Generator;

use strict;
use warnings;

##
# Type: Generator
# Synopsis: The perl code.
#
# PERL(sub{ rand(99999) });
#   => '89827'
##
sub PERL {
    my ($func) = @_;

    return {
        "type" => 'PERL',
        "gen"  => $func
    };
}

1;
