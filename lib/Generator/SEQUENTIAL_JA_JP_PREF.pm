package Generator;

use warnings;
use strict;

##
# Type: Generator
# Synopsis: Japanese prefecture as '北海道' to '沖縄県' in japanese.
#
# SEQUENTIAL_JA_JP_PREF()
#   => '北海道' => '青森県' => '岩手県' ...
##
sub SEQUENTIAL_JA_JP_PREF {
    return {
        "type" => 'SEQUENTIAL_JA_JP_PREF',
        "gen"  => SEQUENTIAL_CHOICE(JA_JP_PREF_ITEMS())->{'gen'}
    };
}

1;
