package DML;

use strict;
use warnings;
use File::Basename;

BEGIN {
    my $dmlDir = dirname(__FILE__) . '/DML';
    my @files = sort map {m%^(/|\./)% ? $_ : "./$_"} glob("$dmlDir/*.pm");
    foreach my $f (@files) {
        if ($f =~ m%/(\w+)\.pm%) {
            eval("use DML::$1;");
        }
    }
}

sub def_options {
    return(
        "driver:s",
        "commit-per-table",
        "commit-per-count:i"
    );
}

sub validate_options {
    my ($this) = @_;

    if (!exists($this->{'options'}->{'driver'})) {
        $this->{'options'}->{'driver'} = 'postgresql';
    }

    if ($this->{'options'}->{'commit-per-count'}) {
        $this->{'options'}->{'commit-per-table'} = 1;
    }
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

sub escapeRsv {
    my ($this, $rsv) = @_;

    if ($this->option('driver') eq 'mysql') {
        return "`$rsv`";
    }
    else {
        return "\"$rsv\"";
    }
}

sub escapeValue {
    # s/$this/undef/ : Suppress warning in IDEA
    my (undef, $value) = @_;

    if ($value !~ m/^[0-9]+$/s) {
        $value =~ s/\'/\'\'/gs;
        $value = "'$value'";
    }

    return $value;
}

1;
