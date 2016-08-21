 
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

print "10:true\n" if $norm =~ /I really like your shoes!/s;
print "11:true\n" if $norm =~ /What are THOSE?/s;
