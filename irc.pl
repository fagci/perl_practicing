#!/usr/bin/perl -w

use strict;
use IO::Socket;

my $host = "irc.libera.chat";
my $port = 6667;

my $nick = "fagci_pl";

my $s = IO::Socket::INET->new(
    PeerAddr => $host,
    PeerPort => $port,
) or die "E: connect: $!\n";

my sub send {
    print $s $_[0] . "\r\n";
}

$SIG{INT} = sub {
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

