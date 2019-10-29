package Generator;

use warnings;
use strict;

##
# Type: Generator
# Synopsis: Selection.
#
# SEQUENTIAL_CHOICE('Male', 'Female', 'Other')
#   => 'Male' => 'Female' => 'Other' => 'Male' ...
##
sub SEQUENTIAL_CHOICE {
    my (@generators) = @_;
    @generators = map {literal_boxing($_)} @generators;

    my $i = 0;
    return {
        "type" => 'SEQUENTIAL_CHOICE',
        "gen"  => sub {
            if ($i >= @generators) {
                $i = 0;
            }
            $generators[$i++]->{'gen'}->(@_);
        }
    };
}

1;
