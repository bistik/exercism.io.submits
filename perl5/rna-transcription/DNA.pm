package DNA;

use strict;
use warnings;

sub to_rna { 
    my $dna = shift;
    $dna =~ tr/T/U/;

    return $dna;
}
1;

