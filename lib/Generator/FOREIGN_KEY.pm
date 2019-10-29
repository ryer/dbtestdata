package Generator;

use strict;
use warnings;

use constant FK_RANDOM => 'random';
use constant FK_INCREMENT => 'increment';
use constant FK_ROTATION => 'rotation';
push(@Generator::EXPORT, qw(FK_RANDOM FK_ROTATION));

##
# Type: Key
# Synopsis: Key selector.
#
# FOREIGN_KEY("table_name")
#   => 72 => 55122 => 937 => 135722 ...
# FOREIGN_KEY("table_name", FK_RANDOM)
#   => 5729 => 99221 => 351 => 7712 ...
# FOREIGN_KEY("table_name", FK_ROTATION)
#   => 1 => 2 => 3 => 1 => 2 => 3 ...
# FOREIGN_KEY("table_name", sub{ my ($fks) = @_; return $fks->[0] })
#   => 'X11-B3' => 'X11-B3' => 'X11-B3' ...
##
sub FOREIGN_KEY {
    my ($table, $fkFetchStrategy) = @_;

    if (!defined $fkFetchStrategy) {
        $fkFetchStrategy = FK_RANDOM;
    }

    my $strategy;
    if ($fkFetchStrategy eq FK_RANDOM) {
        $strategy = \&fk_strategy_random;
    }
    elsif ($fkFetchStrategy eq FK_ROTATION) {
        $strategy = \&fk_strategy_rotation;
    }
    elsif (ref($fkFetchStrategy) eq 'CODE') {
        $strategy = $fkFetchStrategy;
    }
    else {
        die "Bad strategy: FOREIGN_KEY($table)";
    }

    my $fkFetcher;
    return {
        "type" => 'FOREIGN_KEY',
        "gen"  => sub {
            $fkFetcher ||= $strategy->($Generator::primaryKeys{$table} || die("Bad foreign table: FOREIGN_KEY($table)"));
            return $fkFetcher->();
        }
    };
}

sub fk_strategy_random {
    my ($foreignKeys) = @_;

    return sub {
        return $foreignKeys->[int rand scalar @$foreignKeys];
    };
}

sub fk_strategy_rotation {
    my ($foreignKeys) = @_;

    my $i = 0;
    return sub {
        if ($i >= @$foreignKeys) {
            $i = 0;
        }
        return $foreignKeys->[$i++];
    }
}

1;
