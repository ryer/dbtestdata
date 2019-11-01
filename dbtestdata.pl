#! perl --

package dbtestdata;

use strict;
use warnings;
use File::Basename;
use lib dirname(__FILE__) . '/lib';
use Configuration;
use Generator;
use DML;
use Getopt::Long;
use IO::Handle;
binmode STDOUT, ":utf8";

exit main();

sub main {
    my $dmlType = $ARGV[0] || die 'DMLType missing.';

    #@type DML
    my $dmlClazz = "DML::$dmlType";
    my @def_options = eval {$dmlClazz->def_options()};
    if ($@) {
        die "Invalid DMLType [$dmlType].";
    }

    my $options = get_options(@def_options);
    my $config = Configuration->new($options->{'conf'});
    $config->options_each(sub {
        my ($opt, $val) = @_;
        $options->{$opt} = $val;
    });

    my $dml = $dmlClazz->new($options);
    $dml->write($config, *STDOUT);

    return 0;
}

sub get_options {
    my (@def_options) = @_;

    my $options = {};
    GetOptions(
        $options,
        "conf:s",
        "rand-seed:i",
        @def_options
    );

    $options->{'conf'} ||= './dbtestdatafile';
    (-f $options->{'conf'}) || die("Conf not found.");

    if ($options->{'rand-seed'}) {
        srand($options->{'rand-seed'});
    }

    return $options;
}

1;
