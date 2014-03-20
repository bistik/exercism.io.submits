package Wordy;

use strict;
use warnings;

sub answer {
    my @tokens = split /\s+/ => shift;
    my @operators;
    my %answer = (
        plus       => sub { $_[0] + $_[1] },
        minus      => sub { $_[0] - $_[1] },
        multiplied => sub { $_[0] * $_[1] },
        divided    => sub { $_[0] / $_[1] }, # divide by zero ??
    );

    foreach my $token ( @tokens ) {
        push @operators => $token if grep { $_ eq $token } keys %answer;
    }

    die "ArgumentError" unless @operators;

    my @numbers = grep { /-?\d/ } @tokens;

    foreach my $op ( @operators ) {
        my $n1 = shift @numbers;
        my $n2 = shift @numbers;
        unshift @numbers, $answer{$op}->($n1, $n2);
    }

    return shift @numbers;
}
1;
