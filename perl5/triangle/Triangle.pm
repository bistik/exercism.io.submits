package Triangle;

use strict;
use warnings;

sub kind {
    die "TriangleError"  if is_negative_or_zero(@_) or is_inequality(@_);
    return "equilateral" if is_equilateral(@_);
    return "isosceles"   if is_isosceles(@_);
    return "scalene"     if is_scalene(@_);
}
sub is_equilateral {
    return $_[0] == $_[1] && $_[1] == $_[2];
}
sub is_isosceles {
    return $_[0] == $_[1] ||  $_[1] == $_[2] || $_[0] == $_[2];
}
sub is_scalene {
    return $_[0] != $_[1] ||  $_[1] != $_[2] || $_[0] != $_[2];
}
sub is_negative_or_zero { grep { $_ <= 0 } @_ }
sub is_inequality {
    return $_[1] + $_[2] <= $_[0]
        || $_[2] + $_[0] <= $_[1]
        || $_[0] + $_[1] <= $_[2];
}

1;

