package Generator;

use strict;
use warnings;

##
# Type: Literal
# Synopsis: Literal
#
# LITERAL('HELLO')
#   => 'HELLO'
##
sub LITERAL {
    my ($literal) = @_;

    return {
        "type" => 'LITERAL',
        "gen"  => sub {
            $literal
        }
    };
}

1;
