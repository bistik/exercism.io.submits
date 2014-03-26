package Deque;

use strict;
use warnings;

sub new {
    my $self = bless {} => shift;
    $self->{nodes} = undef;
    $self->{tail} = undef;
    $self->{head} = -1;

    return $self;
}

sub push {
    my ($self, $value) = @_;

    my $node = { value => $value, next => -1, prev => -1 };

    unless ( defined $self->{nodes} ) {
        $self->{head} = 0;
        $self->{tail} = 0;
    } else {
        $self->{nodes}->[-1]->{next} = @{$self->{nodes}};
        $self->{tail}++;
    }
    push @{$self->{nodes}} => $node;
    use Data::Dumper;
    print Dumper $self;
}

1;
