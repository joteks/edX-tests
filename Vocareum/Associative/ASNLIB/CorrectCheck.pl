 
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

print "14:true\n" if $norm =~ /[[:alnum:]]+[[:space:]]*.*Grouping/s;
print "15:true\n" if $norm =~ /Grouping the first two terms, \(3 \+ 4\) \* 5 = 35/s;
print "16:true\n" if $norm =~ /Grouping the last two terms, 3 \+ \(4 \* 5\) = 23/s;