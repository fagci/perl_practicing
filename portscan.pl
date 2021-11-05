#!/usr/bin/env perl

use Socket;

$host = '192.168.0.200';
$iaddr = inet_aton($host);
$tcp = getprotobyname('tcp');

foreach $port (1..1024) {
    socket(S, PF_INET, SOCK_STREAM, $tcp);
    $paddr = sockaddr_in($port, $iaddr);
    connect(S, $paddr) && print "$port open\n";
    close(S);
}
