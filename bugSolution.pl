#!/usr/bin/perl

use strict;
use warnings;
use Encode;

my $filename = shift || die "Usage: $0 <filename>\n";

open(my $fh, '<:encoding(UTF-8)', $filename) or die "Could not open file '$filename' $!";

while (my $line = <$fh>) {
    chomp $line;
    # Handle potential encoding issues
    $line = decode('UTF-8', $line, Encode::FB_CROAK); #or other appropriate encoding

    # Check for problematic characters
    if ($line =~ /\p{C}/) { # matches any control character
        warn "Warning: Control characters found in line: " . $line;
        # Handle or skip the line as needed
    }

    print $line, "\n";
}

close $fh;