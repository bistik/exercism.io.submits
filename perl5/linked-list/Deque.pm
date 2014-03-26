package Deque;

use strict;
use warnings;

sub new {
    my $self = bless {} => shift;
    $self->{nodes} = undef;
    $self->{tail} = 0;
    $self->{head} = 0;

    return $self;
}

sub push {
    my ($self, $value) = @_;

    my ($next, $prev) = ($self->{head}, $self->{tail});
    my $node = { value => $value, next => $next, prev => $prev };
    $self->{tail} = push @{$self->{nodes}} => $node;
    $self->{nodes}[$self->{head}]->{prev} = $self->{tail};

    use Data::Dumper;
    print Dumper $self;
}

sub pop {
    my $self = shift;
    
    my $node = $self->{nodes}[$self->{tail}];
    $self->_pop;
    $self->{tail} = $self->{nodes}[$self->{tail}]->{prev};
    $self->{nodes}[$self->{tail}]->{next} = $self->{head};

    return $node->{value};
}

sub _pop {
    pop @{$_[0]->{nodes}}
}

1;
