package Bob;

use strict;
use warnings;

sub hey {
    my $message = shift;

    return say_fine() unless $message;
    return say_fine() if $message =~ /^\s*$/;

    return say_chill() if uc $message eq $message and $message =~ /[a-zA-Z]/;
    return say_sure()  if $message =~ /\?$/;
    return say_whatever();
}

sub say_chill { "Woah, chill out!" }
sub say_fine { "Fine. Be that way!" }
sub say_sure { "Sure." }
sub say_whatever { "Whatever." }

1;

