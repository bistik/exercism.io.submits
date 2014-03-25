package Prime;

use strict;
use warnings;

sub factors {
    my $number = shift;
    my @primes;
    my $factor = 2;
    my $index  = 0;

    while ($number > 1) {
        if ($number % $factor == 0) {
            push @primes => $factor;
            $number = $number / $factor;
        } else {
            $factor++;
        }
    }

    return \@primes;
}

1;

