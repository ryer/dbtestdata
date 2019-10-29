package Generator;

use strict;
use warnings;

##
# Type: Literal
# Synopsis: Unescaped literal.
#
# SQL('NOW()')
#   => NOW()
##
sub SQL {
    my ($literal) = @_;

    return {
        "type" => 'SQL',
        "gen"  => sub {
            $literal
        }
    };
}

1;
