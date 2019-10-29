package Writer::CSV;
use base 'Writer';

use strict;
use warnings;

sub def_options {
    return(
        "table:s",
        "header",
        "separator:s",
        "enclosure:s"
    );
}

sub validate_options {
    my ($this) = @_;

    if (!exists($this->{'options'}->{'separator'})) {
        $this->{'options'}->{'separator'} = ',';
    }

    # Eval escape sequence.
    if ($this->{'options'}->{'separator'} =~ m/^(\\\w+)+$/s) {
        $this->{'options'}->{'separator'} = eval('"' . $this->{'options'}->{'separator'} . '"');
    }

    if (!exists($this->{'options'}->{'enclosure'})) {
        $this->{'options'}->{'enclosure'} = '"';
    }
}

sub write {
    my (
        $this,
        #@type Configuration
        $config,
        #@type IO::Handle
        $output
    ) = @_;

    my $target = ($config->tables())[0]->{'table'};
    if ($this->option('table')) {
        $target = $this->option('table');
    }

    if ($this->option('header')) {
        my @values;
        foreach my $it ($config->tables()) {
            next if ($it->{'table'} ne $target);
            foreach my $col (@{$it->{'generators'}}) {
                push(@values, $this->_encloseValue($col->{'name'}));
            }
        }
        $output->print(join($this->option('separator'), @values), "\n");
    }

    foreach my $it ($config->tables()) {
        my ($table, $count, $generators) = ($it->{'table'}, $it->{'count'}, $it->{'generators'});

        my $done = 0;
        foreach (0 .. $count) {
            eval {
                my $csv = $this->_generate($table, $generators);
                if ($it->{'table'} eq $target) {
                    $output->print($csv, "\n");
                    $done = 1;
                }
            };
            if ($@) {
                die sprintf("An error occurred: [%s] in %s", $@, $config->name());
            }
        }

        last if ($done);
    }
}

sub _generate {
    my ($this, $table, $generators) = @_;

    my @values;
    foreach my $col (@$generators) {
        push(@values, $this->_encloseValue($col->{'generator'}->{'gen'}->($table, $col->{'name'})));
    }

    return join($this->option('separator'), @values);
}

sub _encloseValue {
    my ($this, $value) = @_;

    my $enclosure = $this->option('enclosure');

    if ($value =~ m/(\Q$enclosure\E|\n)/s) {
        $value = "$enclosure$value$enclosure";
    }

    return $value;
}

1;
