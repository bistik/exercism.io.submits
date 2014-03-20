package Anagram;

use strict;
use warnings;

sub match {
    my ($word, @candidates) = @_;
    my @matches;

    foreach my $candidate ( @candidates ) {
        push @matches => $candidate if equal($word, $candidate);
    }

    return \@matches;
}

sub equal {
    my ($word, $candidate) = map { lc } @_;

    return 0 if $word eq $candidate;
    return 0 if length $word != length $candidate;

    my @word      = split '' => $word;
    my @candidate = split '' => $candidate;

    foreach my $w_index ( 0 .. $#word ) {
        foreach my $c_index ( 0 .. $#candidate ) {
            if ($word[$w_index] eq $candidate[$c_index]) {
                splice @candidate, $c_index, 1; 
                last;
            }
        }
    }
    return @candidate > 0 ? 0 : 1;
}

1;

