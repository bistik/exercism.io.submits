package Bob;

use strict;
use warnings;

sub hey {
    my $message = shift;

    return fine()  if    blank($message);
    return chill() if shouting($message);
    return sure()  if question($message);
    return whatever();
}

sub blank {
    my $message = shift;
    return 1 unless $message;
    return 1 if $message =~ /^\s*$/;
    return 0;
}

sub shouting {
    my $message = shift;
    if (uc $message eq $message and $message =~ /[a-zA-Z]/) {
        return 1;
    }
    return 0;
}

sub question {
    my $message = shift;
    return $message =~ /\?$/ ? 1 : 0;
}

sub chill { "Woah, chill out!" }
sub fine { "Fine. Be that way!" }
sub sure { "Sure." }
sub whatever { "Whatever." }

1;

