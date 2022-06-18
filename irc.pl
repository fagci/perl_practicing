#!/usr/bin/perl -w

use strict;
use IO::Socket;

my $nick = "fagci_pl";

my $s = IO::Socket::INET->new(
    PeerAddr => 'irc.libera.chat',
    PeerPort => 6667,
) or die "E: connect: $!\n";

my sub send {
    print $s @_, "\r\n";
}

$SIG{INT} = $SIG{TERM} = sub {
    send 'QUIT';
    close $s;
    exit;
};

send "NICK $nick";
send "USER $nick * $nick $nick";

while(<$s>) {
    print;
    print $s s/PING/PONG/ if m/^PING/;
}

