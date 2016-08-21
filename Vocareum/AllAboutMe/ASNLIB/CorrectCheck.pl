 
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

print "12:true\n" if (($norm =~ /[[:alnum:]]+[[:space:]]*.*My name is/s) || ($extra =~ /[[:alnum:]]+[[:space:]]*.*My name is/s));
print "13:true\n" if (($norm =~ /My name is ([[:alpha:]]|[[:space:]])*, and I attend ([[:alpha:]]|[[:space:]])*\. I am [[:digit:]]* years old\./s) || 
	($extra =~ /My name is Robyn, and I attend Purdue\. I am 20 years old\./s));
print "14:true\n" if ($extra =~ /My name is Robyn, and I attend Purdue\. I am 20 years old\./s);
