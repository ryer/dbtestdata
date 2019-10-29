package Generator;

use warnings;
use strict;
use utf8;

##
# Type: Generator
# Synopsis: Hiragana in japanese.
#
# RANDOM_JA_HIRAGANA(20)
#   => 'にぱんべそのくるぇけあうぃをぶぁぇえおい'
# RANDOM_JA_HIRAGANA(100, 40)
#   => 'なうええけちあぺそのり ... ゆあゅとんきげらそ'
##
sub RANDOM_JA_HIRAGANA {
    my ($size, $min) = @_;

    if (!defined $min) {
        $min = $size;
    }

    my $str = 'あいうえおかきくけこさしすせそたちつてとなにぬねのはひふへほまみむめもやゆよらりるれろわをん';
    my $strlen = length($str);

    return {
        "type" => 'RANDOM_JA_HIRAGANA',
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
