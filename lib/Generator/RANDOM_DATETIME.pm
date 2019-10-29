package Generator;

use warnings;
use strict;
use Time::Local;
use POSIX;

##
# Type: Generator
# Synopsis: Date and time.
#
# RANDOM_DATETIME("2010-01-05 10:34:25")
#   => '2009-01-01 09:22:34'
# RANDOM_DATETIME("2019-01-05", "2000-09-10", "%Y-%m-%d %H:%M:%S")
#   => '2013-08-25 12:22:45'
# RANDOM_DATETIME(undef, "2015-00-10", "%Y/%m/%d")
#   => '2006/12/22'
##
sub RANDOM_DATETIME {
    my ($to, $from, $dateFormat) = @_;

    my $timeTo;
    if (!$to) {
        $timeTo = time();
    }
    elsif ($to =~ m/(\d\d\d\d)-(\d\d)-(\d\d) (\d\d):(\d\d):(\d\d)/) {
        $timeTo = Time::Local::timelocal($6, $5, $4, $3, $2 - 1, $1);
    }
    elsif ($to =~ m/(\d\d\d\d)-(\d\d)-(\d\d)/) {
        $timeTo = Time::Local::timelocal(59, 59, 23, $3, $2 - 1, $1);
    }
    else {
        die("RANDOM_DATETIME: invalid datetime '$to'");
    }

    my $timeFrom;
    if (!$from) {
        $timeFrom = time();
    }
    elsif ($from =~ m/(\d\d\d\d)-(\d\d)-(\d\d) (\d\d):(\d\d):(\d\d)/) {
        $timeFrom = Time::Local::timelocal($6, $5, $4, $3, $2 - 1, $1);
    }
    elsif ($from =~ m/(\d\d\d\d)-(\d\d)-(\d\d)/) {
        $timeFrom = Time::Local::timelocal(0, 0, 0, $3, $2 - 1, $1);
    }
    else {
        die("RANDOM_DATETIME: invalid datetime '$from'");
    }

    if (!$dateFormat) {
        $dateFormat = "%Y-%m-%d %H:%M:%S";
    }

    return {
        "type" => 'RANDOM_DATETIME',
        "gen"  => sub {
            my $randomIt = int rand($timeTo - $timeFrom);
            POSIX::strftime($dateFormat, localtime($timeFrom + $randomIt));
        }
    };
}

1;
