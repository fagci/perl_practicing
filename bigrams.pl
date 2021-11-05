#!/usr/bin/env perl

my $n = 2;
my $text = join '', <STDIN>;
my %ngrams;

foreach $word ($text =~ /(\w+)/g) {
    $wlen = length $word;
    for($i = 0; $i < $wlen - $n + 1; $i++) {
        $ngrams{substr($word, $i, $n)}++;
    }
}

@ngrams = reverse sort({ $ngrams{$a} <=> $ngrams{$b} } keys %ngrams);

print "@ngrams\n";
