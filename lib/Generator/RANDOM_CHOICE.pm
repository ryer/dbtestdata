package Generator;

use warnings;
use strict;

##
# Type: Generator
# Synopsis: Selection.
#
# RANDOM_CHOICE('Male', 'Female', 'Other')
#   => 'Female'
# RANDOM_CHOICE('Music', 'Sport', RANDOM_ALPHA(30, 5))
#   => 'ValkUOkfhaax' => 'Music' => 'UmxkAj' ...
##
sub RANDOM_CHOICE {
    my (@generators) = @_;
    @generators = map {literal_boxing($_)} @generators;

    return {
        "type" => 'RANDOM_CHOICE',
        "gen"  => sub {
            $generators[int rand scalar @generators]->{'gen'}->(@_);
        }
    };
}

1;
