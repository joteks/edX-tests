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
	$extra = <$fh>;
}
close($fh);

print "14:true\n" if $norm =~ /[[:alnum:]]+[[:space:]]*.*This user/s;
print "15:true\n" if (
	($norm =~ /This user's email is: rberkel@[[:alnum:]]*\.[[:alnum:]]*/s) || 
	($norm =~ /This user's email is: roberkel@[[:alnum:]]*\.[[:alnum:]]*/s)
	);
print "17:true\n" if $norm =~ /This user's e-mail is: roberkel@[[:alnum:]]*\.[[:alnum:]]*/s;
print "16:true\n" if $extra =~ /This user's e-mail is: rberkele@[[:alnum:]]*\.[[:alnum:]]*/s;
print "18:true\n" if $extra2 =~ /This user's e-mail is: robexxxx@[[:alnum:]]*\.[[:alnum:]]*/s;

