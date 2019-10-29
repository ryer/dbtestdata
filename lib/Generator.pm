package Generator;
use base Exporter;

use strict;
use warnings;
use File::Basename;

##
# The "Generator" struct:
#   {
#     gen  => sub{ ... }
#     type => 'RANDOM_CHOICE',
#   }
#
# Call like below:
#   gen('table_name', 'column_name')
##

our @EXPORT;
BEGIN {
    my $generatorsDir = dirname(__FILE__) . '/Generator';
    my @files = sort map {m%^(/|\./)% ? $_ : "./$_"} glob("$generatorsDir/*.pm");
    foreach my $f (@files) {
        if ($f =~ m%/(\w+)\.pm%) {
            require($f) or die "Failed to load Generator: $f [$!]";
            push(@EXPORT, $1);
        }
    }
}

##
# $literal_generator = literal_boxing('value');
##
sub literal_boxing {
    my ($value) = @_;

    if (ref($value) eq 'HASH' and exists($value->{'gen'})) {
        return $value;
    }
    else {
        return LITERAL($value);
    }
}

1;
