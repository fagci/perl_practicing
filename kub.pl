#!/usr/bin/env perl

foreach $n (102..987) {
    my %dup;

    @kub = $n =~ /(\d)/g;
    @uniq = grep !$dup{$_}++, @kub;

    next unless @uniq == 3;

    $ssum = join '+', @kub;

    next unless (eval $ssum)**3 == $n;

    printf "(%s)^3=%d\n", $ssum, $n;
}
