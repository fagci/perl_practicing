#!/usr/bin/env perl

do {
    chomp;
    print eval, "\n" if /./;
    print '> ';
} while(<>);
