package Queens;

use strict;
use warnings;

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
    $self->_put_queens;

    return $self;
}

sub white { $_[0]->{white} }
sub black { $_[0]->{black} }

sub can_attack {
    my $self = shift;

    return 1 if $self->_can_attack_straight;
    return 1 if $self->_can_attack_diagonal;
}

sub _can_attack_straight {
    my $self = shift;

    return 1 if $self->{white}->[0] == $self->{black}->[0];
    return 1 if $self->{white}->[1] == $self->{black}->[1];
}

sub _can_attack_diagonal {
    my $self = shift;
    my $distance = $self->{white}->[0] - $self->{black}->[0];

    return 1 if $self->{black}->[1] - $distance == $self->{white}->[1];
    return 1 if $self->{black}->[1] + $distance == $self->{white}->[1];
}

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

    @{ $self->{board} }  = map { [qw(O O O O O O O O)] }  1 .. 8;

}

sub _put_queens {
    my $self = shift;
    my ($x, $y);

    $x = $self->{white}->[0];
    $y = $self->{white}->[1];
    $self->{board}->[$x]->[$y] = 'W';

    $x = $self->{black}->[0];
    $y = $self->{black}->[1];
    $self->{board}->[$x]->[$y] = 'B';
}

sub to_string {
    my $self = shift;

    my $str;
    foreach my $ar ( @{ $self->{board} } ) {
        $str .= "@$ar\n";
    }
    return $str;
}

1;
