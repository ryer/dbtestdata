package Generator;

use warnings;
use strict;
use utf8;

##
# Type: Generator
# Synopsis: Katakana in japanese.
#
# RANDOM_JA_KATAKANA(20)
#   => 'パンベソノクルェケアウィアヲヴァォエオイ'
# RANDOM_JA_KATAKANA(100, 40)
#   => 'ナコソルリパンベソノク ... アイエオヲヴァォエ'
##
sub RANDOM_JA_KATAKANA {
    my ($size, $min) = @_;

    if (!defined $min) {
        $min = $size;
    }

    my $str = 'アイウエオカキクケコサシスセソタチツテトナニヌネノハヒフヘホマミムメモヤユヨラリルレロワヲン';
    my $strlen = length($str);

    return {
        "type" => 'RANDOM_JA_KATAKANA',
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
