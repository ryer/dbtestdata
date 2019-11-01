package DML::InsertSQL;
use base 'DML';

use strict;
use warnings;

sub write {
    my (
        $this,
        #@type Configuration
        $config,
        #@type IO::Handle
        $output
    ) = @_;

    $output->print("BEGIN;\n");

    $config->tables_each(sub {
        my ($table, $count, $generators) = @_;

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
    });

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
            push(@values, $this->escapeValue($generator->{'gen'}->($table, $col->{'name'})));
        }
    }

    my $sql = '';
    $sql .= "INSERT INTO " . $this->escapeRsv($table) . " (";
    $sql .= join(",", map {$this->escapeRsv($_)} @cols);
    $sql .= ') VALUES (';
    $sql .= join(',', @values);
    $sql .= ');';

    return $sql;
}

1;
