package Configuration;

use strict;
use warnings;
use Generator;

sub new {
    my ($clazz, $file) = @_;

    $file = ($file =~ m%^(/|\./)%) ? $file : "./$file";
    my $configuration = require($file);
    $configuration = _validate($configuration);

    my $this = {
        file          => $file,
        configuration => $configuration
    };

    return bless($this, $clazz);
}

sub name {
    my ($this) = @_;

    return $this->{'configuration'}->{'name'};
}

sub options {
    my ($this) = @_;

    return %{$this->{'configuration'}->{'options'}};
}

sub tables {
    my ($this) = @_;

    return @{$this->{'configuration'}->{'tables'}};
}

sub _validate {
    my ($configuration) = @_;

    $configuration->{'name'} || die "Invalid configuration [name missing].";

    if ($configuration->{'options'}) {
        if (ref($configuration->{'options'}) ne 'HASH') {
            die "Invalid configuration [options expects HashRef].";
        }
    }

    if (ref($configuration->{'tables'} ne 'ARRAY')) {
        die "Invalid configuration [tables expects ArrayRef].";
    }

    foreach my $it (@{$configuration->{'tables'}}) {
        $it->{'table'} || die "Invalid configuration [table name missing].";
        my $table = $it->{'table'};

        $it->{'count'} || die "Invalid configuration [count missing in $table].";
        $it->{'columns'} || die "Invalid configuration [columns missing in $table].";

        $it->{'generators'} = _columns2generators($table, $it->{'columns'});
    }

    return $configuration;
}

sub _columns2generators {
    my ($table, $columns) = @_;

    if (ref($columns) eq 'ARRAY' and ref($columns->[0]) eq 'HASH') {
        foreach my $it (@$columns) {
            $it->{'name'} || die "Invalid configuration [name missing in $table.columns].";
            $it->{'generator'} || die "Invalid configuration [generator missing in $table.columns].";
            $it->{'generator'} = Generator::literal_boxing($it->{'generator'}),
        }
        return $columns;
    }
    elsif (ref($columns) eq 'ARRAY') {
        my $generators = [];
        for (my $i = 0; $i < @$columns; $i += 2) {
            push(@$generators, {
                'name'      => $columns->[$i],
                'generator' => Generator::literal_boxing($columns->[$i + 1]),
            });
        }
        return $generators;
    }
    elsif (ref($columns) eq 'HASH') {
        my $generators = [];
        foreach my $name (sort keys(%$columns)) {
            push(@$generators, {
                'name'      => $name,
                'generator' => Generator::literal_boxing($columns->{$name}),
            });
        }
        return $generators;
    }
    else {
        die "Invalid configuration [bad columns].";
    }
}

1;
