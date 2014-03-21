package Queens;

use strict;
use warnings;

use Data::Dumper;

sub new {
    my ($class, %board) = @_;
    my $self = bless {} => $class;

    if ( keys %board ) {
        $self->_is_valid_position($board{white});
        $self->_is_valid_position($board{black});
        $self->_is_same_position ($board{white}, $board{black});
    }

    $self->{white} = $board{white} || [0, 3];
    $self->{black} = $board{black} || [7, 3];
    $self->_make_board;

    return $self;
}

sub white { $_[0]->{white} }
sub black { $_[0]->{black} }
sub can_attack {}
sub _is_valid_position {
    my ($self, $position) = @_;
    
    die "ArgumentError" if $position->[0] < 0 or $position->[1] < 0;
    die "ArgumentError" if $position->[0] > 7 or $position->[1] > 7;
}
sub _is_same_position {
    my ($self, $p1, $p2) = @_;

    die "ArgumentError" if ($p1->[0] == $p2->[0]) && ($p2->[1] == $p1->[1]);
}
sub _make_board {
    my $self = shift;

    $self->{board} = map { [(0) x 8] }  1 .. 8;
}
sub to_string {
    my $self = shift;
}

1;
