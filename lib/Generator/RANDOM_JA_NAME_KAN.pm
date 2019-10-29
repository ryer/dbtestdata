package Generator;

use warnings;
use strict;
use utf8;

##
# Type: Generator
# Synopsis: Person name (Kanji) in japanese.
#
# RANDOM_JA_NAME_KAN(' ')
#   => "山田 太郎"
##
sub RANDOM_JA_NAME_KAN {
    my ($separator) = @_;

    if (!$separator) {
        $separator = '';
    }

    my $genFamiry = RANDOM_JA_FAMILYNAME_KAN()->{'gen'};
    my $genFirst = RANDOM_JA_FIRSTNAME_KAN()->{'gen'};

    return {
        "type" => 'RANDOM_JA_NAME_KAN',
        "gen"  => sub {
            $genFamiry->() . $separator . $genFirst->();
        }
    };
}

1;
