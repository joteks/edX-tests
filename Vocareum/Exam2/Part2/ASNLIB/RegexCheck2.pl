#!/bin/bash/perl
use strict;
use warnings;

my $program;
open(my $fh, '<', "$ARGV[0]/Work/GiveChange.java") or die "cannot open file GiveChange.java";
{
	local $/;
	$program = <$fh>;
}
close($fh);

print "0:true\n" if $program =~ /return/s;
print "1:true\n" if $program =~ /return.*return/s;
print "2:true\n" if $program =~ /return.*return.*return/s;
print "3:true\n" if $program =~ /return.*return.*return.*return/s;