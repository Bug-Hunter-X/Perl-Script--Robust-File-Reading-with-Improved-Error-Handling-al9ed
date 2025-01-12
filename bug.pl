#!/usr/bin/perl

use strict;
use warnings;

my $filename = shift || die "Usage: $0 <filename>\n";

open(my $fh, '<', $filename) or die "Could not open file '$filename' $!";

while (my $line = <$fh>) {
    chomp $line;
    # Process each line here
    print $line, "\n";
}

close $fh;