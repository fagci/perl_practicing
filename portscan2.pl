#!/usr/bin/env perl

use IO::Socket::INET;

$host = '192.168.0.200';

foreach $port (1..1024) {
    $client = IO::Socket::INET->new("${host}:${port}");
    print "$port open\n" if $client;
    close($client);
}
