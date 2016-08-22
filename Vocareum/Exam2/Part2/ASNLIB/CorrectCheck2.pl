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

my $ec;
open($fh, '<', "ecresults.txt") or die "cannot open file ecresults.txt";
{
	local $/;
	$ec = <$fh>;
}
close($fh);

my $ec2;
open($fh, '<', "ecresults2.txt") or die "cannot open file ecresults2.txt";
{
	local $/;
	$ec2 = <$fh>;
}
close($fh);

print "4:true\n" if $norm =~ /2 quarters/s;
print "5:true\n" if $norm =~ /1 dimes/s;
print "6:true\n" if $norm =~ /0 nickels/s;
print "7:true\n" if $norm =~ /0 pennies/s;
print "8:true\n" if $ec =~ /2 quarters/s;
print "9:true\n" if $ec =~ /2 dimes/s;
print "10:true\n" if $ec =~ /0 nickels/s;
print "11:true\n" if $ec =~ /2 pennies/s;
print "12:true\n" if $ec2 =~ /3 quarters/s;
print "13:true\n" if $ec2 =~ /1 dimes/s;
print "14:true\n" if $ec2 =~ /1 nickels/s;
print "15:true\n" if $ec2 =~ /4 pennies/s;


