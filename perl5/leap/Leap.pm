package Leap;

use strict;
use warnings;
use feature 'switch';

sub is_leap {
    my $year = shift;

    return 0 if $year % 4 != 0;
    return 0 if $year % 4 == 0 and $year % 100 == 0 and $year % 400 != 0;
    return 1;
}

1;
