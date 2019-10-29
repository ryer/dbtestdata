package Writer::TSV;
use base 'Writer::CSV';

use strict;
use warnings;

sub validate_options {
    my ($this) = @_;

    $this->{'options'}->{'separator'} = "\t";
    $this->{'options'}->{'enclosure'} = '';
}

1;
