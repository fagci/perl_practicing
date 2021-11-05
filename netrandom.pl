#!/usr/bin/env perl
# !!! Not tested

use threads;
use IO::Socket::INET;

$iips = 0x1000000;
$iipe = 0xE0000000;

sub gen_ip() {
    my $intip = $iips + int(rand( $iipe - $iips + 1 ));
    my $ip = join('.', unpack('C*', pack('N', $intip)));
    return gen_ip() if 
    ($intip >= 0xAFFFFFF && $intip<= 0xAFFFFFF) ||
    ($intip >= 0x647FFFFF && $intip<= 0x647FFFFF) ||
    ($intip >= 0x7FFFFFFF && $intip<= 0x7FFFFFFF) ||
    ($intip >= 0xA9FEFFFF && $intip<= 0xA9FEFFFF) ||
    ($intip >= 0xAC1FFFFF && $intip<= 0xAC1FFFFF) ||
    ($intip >= 0xC0000007 && $intip<= 0xC0000007) ||
    ($intip >= 0xC00000AB && $intip<= 0xC00000AB) ||
    ($intip >= 0xC00002FF && $intip<= 0xC00002FF) ||
    ($intip >= 0xC0A8FFFF && $intip<= 0xC0A8FFFF) ||
    ($intip >= 0xC613FFFF && $intip<= 0xC613FFFF) ||
    ($intip >= 0xC63364FF && $intip<= 0xC63364FF) ||
    ($intip >= 0xCB0071FF && $intip<= 0xCB0071FF) ||
    ($intip >= 0xFFFFFFFF && $intip<= 0xFFFFFFFF);

    return $ip;
}

sub check() {
    $ip = gen_ip();
    $client = IO::Socket::INET->new("${ip}:80");
    print "$ip\n" if $client;
    close($client);
}

for $t (1..1024) {
  push @threads, threads->create(\&check);
}

$t->join() foreach my $t (@threads);
