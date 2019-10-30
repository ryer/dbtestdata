package DML;

use strict;
use warnings;
use File::Basename;

BEGIN {
    my $writerDir = dirname(__FILE__) . '/DML';
    my @files = sort map {m%^(/|\./)% ? $_ : "./$_"} glob("$writerDir/*.pm");
    foreach my $f (@files) {
        if ($f =~ m%/(\w+)\.pm%) {
            eval("use DML::$1;");
        }
    }
}

sub def_options {
    return(
    );
}

sub validate_options {
}

sub new {
    my ($clazz, $options) = @_;

    my $this = bless({ options => { %$options } }, $clazz);

    $this->validate_options();

    return $this;
}

sub write {
}

sub option {
    my ($this, $name) = @_;

    return $this->{'options'}->{$name};
}

1;
