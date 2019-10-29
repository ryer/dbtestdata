#! perl --

package dbtestdata;

use strict;
use warnings;
use File::Basename;
use lib dirname(__FILE__) . '/lib';
use Configuration;
use Generator;
use Writer;
use Getopt::Long;
use IO::Handle;
binmode STDOUT, ":utf8";

exit main();

sub main {
    my $dataType = $ARGV[0];

    #@type Writer
    my $writerClazz = "Writer::$dataType";
    my @def_options = eval {$writerClazz->def_options()};
    if ($@) {
        die "Invalid DataType [$dataType].";
    }

    my $options = get_options(@def_options);
    my $config = Configuration->new($options->{'conf'});

    my $writer = $writerClazz->new($options);
    $writer->write($config, *STDOUT);

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
