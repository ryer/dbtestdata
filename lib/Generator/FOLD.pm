package Generator;

use strict;
use warnings;

##
# Type: Formatter
# Synopsis: Add new line.
#
# FOLD(15, RANDOM_ALPHA(100))
#   => "DkMbHuBVHUHbfuq\nPDxBNFjhFFbGhjs\nCfyhGNUbD ...'
##
sub FOLD {
    my ($cols, $generator) = @_;
    $generator = literal_boxing($generator);

    return {
        "type" => 'FOLD',
        "gen"  => sub {
            my $value = $generator->{'gen'}->(@_);
            my $cur = $cols;
            while ($cur < length($value)) {
                substr($value, $cur, 0) = "\n";
                $cur += $cols + 1;
            }
            return $value;
        }
    };
}

1;
