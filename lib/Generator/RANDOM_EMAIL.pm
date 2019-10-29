package Generator;

use warnings;
use strict;

my @domains = (
    'com.test', 'tw.test', 'kr.test', 'cn.test', 'jp.test', 'tv.test', 'org.test', 'net.test', 'tw.test'
);

##
# Type: Generator
# Synopsis: Email.
#
# RANDOM_EMAIL()
#   => 'dykUnDp@jhdnEkgtX.com.test'
##
sub RANDOM_EMAIL {
    my $genUser = RANDOM_ALPHA(10, 5)->{'gen'};
    my $genHost = RANDOM_ALPHA(10, 5)->{'gen'};

    return {
        "type" => 'RANDOM_EMAIL',
        "gen"  => sub {
            $genUser->() . '@' . $genHost->() . '.' . $domains[int rand scalar @domains];
        }
    };
}

1;
