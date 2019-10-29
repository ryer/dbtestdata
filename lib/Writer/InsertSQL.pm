package Writer::InsertSQL;
use base 'Writer';

use strict;
use warnings;

sub def_options {
    return(
        "sql-type:s",
        "commit-per-table",
        "commit-per-count:i"
    );
}

sub validate_options {
    my ($this) = @_;

    if (!exists($this->{'options'}->{'sql-type'})) {
        $this->{'options'}->{'sql-type'} = 'sql99';
    }

    if ($this->{'options'}->{'commit-per-count'}) {
        $this->{'options'}->{'commit-per-table'} = 1;
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

    $output->print("BEGIN;\n");

    foreach my $it ($config->tables()) {
        my ($table, $count, $generators) = ($it->{'table'}, $it->{'count'}, $it->{'generators'});

        my $current = 0;
        while ($current < $count) {
            $current++;
            eval {
                my $sql = $this->_generate($table, $generators);
                $output->print($sql, "\n");
            };
            if ($@) {
                die sprintf("An error occurred: %s in [%s]", $@, $config->name());
            }

            if ($this->option('commit-per-count') and (!($current % $this->option('commit-per-count')))) {
                $output->print("COMMIT;\n");
                $output->print("BEGIN;\n");
            }
        }

        if ($this->option('commit-per-table')) {
            $output->print("COMMIT;\n");
            $output->print("BEGIN;\n");
        }
    }

    $output->print("COMMIT;\n");
}

sub _generate {
    my ($this, $table, $generators) = @_;

    my @cols;
    my @values;
    foreach my $col (@$generators) {
        my $generator = $col->{'generator'};
        push(@cols, $col->{'name'});

        if ($generator->{'type'} eq 'SQL') {
            push(@values, $generator->{'gen'}->($table, $col->{'name'}));
        }
        else {
            push(@values, $this->_escapeValue($generator->{'gen'}->($table, $col->{'name'})));
        }
    }

    my $sql = '';
    $sql .= "INSERT INTO " . $this->_escapeRsv($table) . " (";
    $sql .= join(",", map {$this->_escapeRsv($_)} @cols);
    $sql .= ') VALUES (';
    $sql .= join(',', @values);
    $sql .= ');';

    return $sql;
}

sub _escapeRsv {
    my ($this, $rsv) = @_;

    if ($this->option('sql-type') eq 'mysql') {
        return "`$rsv`";
    }
    else {
        return "\"$rsv\"";
    }
}

sub _escapeValue {
    # s/$this/undef/ : Suppress warning in IDEA
    my (undef, $value) = @_;

    if ($value !~ m/^[0-9]+$/s) {
        $value =~ s/\'/\'\'/gs;
        $value = "'$value'";
    }

    return $value;
}

1;
