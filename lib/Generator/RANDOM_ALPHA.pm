package Generator;

use warnings;
use strict;

##
# Type: Generator
# Synopsis: Alphabet.
#
# RANDOM_ALPHA(20)
#   => 'CAHJkiJGUIuuZaqoUjtg' (length == 20)
# RANDOM_ALPHA(100, 40)
#   => 'aSoigqTuqWeikdqoUYIQ ... jJHCAHJkiJGUIukygfuE' (length == 40 .. 100)
##
sub RANDOM_ALPHA {
    my ($size, $min) = @_;

    if (!defined $min) {
        $min = $size;
    }

    my $str = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    my $strlen = length($str);

    return {
        "type" => 'RANDOM_ALPHA',
        "gen"  => sub {
            my $sz = 0;
            if ($size == $min) {
                $sz = $size;
            }
            else {
                $sz = int rand($size + 1 - $min) + $min;
            }

            my $value = '';
            while ($sz--) {
                my $pos = int rand($strlen);
                $value .= substr($str, $pos, 1);
            }
            return $value;
        }
    };
}

1;
