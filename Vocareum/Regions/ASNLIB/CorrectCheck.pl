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

my $extra4;
open($fh, '<', "ecresults4.txt") or die "cannot open file ecresults4.txt";
{
	local $/;
	$extra4 = <$fh>;
}
close($fh);

my $extra5;
open($fh, '<', "ecresults5.txt") or die "cannot open file ecresults5.txt";
{
	local $/;
	$extra5 = <$fh>;
}
close($fh);

print "14:true\n" if $norm =~ /[[:alnum:]]+[[:space:]]*.*The state/s;
print "14:true\n" if $norm =~ /The state NH is in the New England region/s;
print "15:true\n" if $extra =~ /The state NJ is in the Atlantic region/s;
print "16:true\n" if $extra2 =~ /The state TN is in the Southwest region/s;
print "17:true\n" if $extra3 =~ /The state IN is in the Midwest region/s;
print "18:true\n" if $extra4 =~ /The state ND is in the Great Plains region/s;
print "19:true\n" if $extra5 =~ /This is an invalid state abbreviation/s;

