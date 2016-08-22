#/bin/bash/perl

use strict;
use warnings;

my $norm;
open(my $fh, '<', "normresults.txt") or die "cannot open file normresults.txt";
{
	local $/;
	$norm = <$fh>;
}
close($fh);

print "3:true\n" if $norm =~ /We love/s;
print "4:true\n" if $norm !~ /very/s;
print "5:true\n" if $norm =~ /We love Computer Science so much!/s;
print "6:true\n" if $norm =~ /We love Computer Science so (very )*much!/s;
