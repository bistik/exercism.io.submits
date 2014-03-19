package Phrase;

use strict;
use warnings;

sub word_count {
    my %wc;

    foreach my $word ( split /\W+/ => shift ) {
        $wc{lc $word} += 1;
    }

    return \%wc;
}
1;
