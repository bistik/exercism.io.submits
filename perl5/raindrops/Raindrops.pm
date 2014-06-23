package Raindrops;

use strict;
use warnings;

sub convert {
    my $number = shift;
    my @factors = _factors($number);
    my $raindrop = '';

    my %rain_table = (
        3 => "Pling",
        5 => "Plang",
        7 => "Plong",
    );

    foreach my $num ( sort keys %rain_table ) {
        $raindrop .= $rain_table{$num} if grep { $_ eq $num } @factors;
    }

    return $raindrop || $number;
}

# reused from perl5/prime-factors
sub _factors {
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

    return @primes;
}

__PACKAGE__;
