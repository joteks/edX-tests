#!/bin/bash/perl
use strict;
use warnings;

my $program;
open(my $fh, '<', "$ARGV[0]/Work/RemoveIt.java") or die "cannot open file RemoveIt.java";
{
	local $/;
	$program = <$fh>;
}
close($fh);

print "0:true\n" if $program =~ /String[[:space:]]*[[:alnum:]]+[[:space:]]*/s;
print "1:true\n" if $program =~ /return/s;