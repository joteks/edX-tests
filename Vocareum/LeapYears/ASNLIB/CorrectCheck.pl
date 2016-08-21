 
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

my $extra;
open($fh, '<', "ecresults.txt") or die "cannot open file ecresults.txt";
{
	local $/;
	$extra = <$fh>;
}
close($fh);

my $extra2;
open($fh, '<', "ecresults2.txt") or die "cannot open file ecresults2.txt";
{
	local $/;
	$extra2 = <$fh>;
}
close($fh);

my $extra3;
open($fh, '<', "ecresults3.txt") or die "cannot open file ecresults3.txt";
{
	local $/;
	$extra3 = <$fh>;
}
close($fh);

print "14:true\n" if $norm =~ /[[:alnum:]]+[[:space:]]*.*The year/s;
print "15:true\n" if $norm =~ /The year 2016 is a leap year./s;
print "16:true\n" if $extra =~ /The year 2300 is not a leap year./s;
print "17:true\n" if $extra2 =~ /The year 800 is a leap year./s;
print "18:true\n" if $extra3 =~ /The year 1995 is not a leap year./s;


