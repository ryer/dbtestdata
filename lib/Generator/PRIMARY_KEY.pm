package Generator;

use strict;
use warnings;

# Friend FOREIGN_KEY
our %primaryKeys;

##
# Type: Key
# Synopsis: Define primary key.
#
# PRIMARY_KEY(COUNTER())
#   => 1 => 2 => 3 ...
##
sub PRIMARY_KEY {
    my ($generator) = @_;

    return {
        "type" => 'PRIMARY_KEY',
        "gen"  => sub {
            my ($table) = @_;

            $primaryKeys{$table} ||= [];

            my $key = $generator->{'gen'}->(@_);
            push(@{$primaryKeys{$table}}, $key);

            return $key;
        }
    };
}

1;
