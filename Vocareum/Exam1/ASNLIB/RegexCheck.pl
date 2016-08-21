 
#!/bin/bash/perl
use strict;
use warnings;

my $program;
open(my $fh, '<', "$ARGV[0]/Work/Shoes.java") or die "cannot open file Shoes.java";
{
	local $/;
	$program = <$fh>;
}
close($fh);

print "0:true\n" if $program =~ /I really like your shoes!/s;
print "1:true\n" if $program =~ /What are THOSE?/s;
print "2:true\n" if $program =~ /return/s;
print "3:true\n" if $program =~ /return.*return/s;
print "4:true\n" if $program =~ /Shoes[[:space:]]*[[:alnum:]]*[[:space:]]*=[[:space:]]new[[:space:]]Shoes[[:space:]]*\(/s;
print "5:true\n" if $program =~ /System.out.println[[:space:]]*\(/s;
print "6:true\n" if $program =~ /System.out.println[[:space:]]*\(.*System.out.println[[:space:]]*\(/s;
print "7:true\n" if $program =~ /main.*goodShoes[[:space:]]*\(/s;
print "8:true\n" if $program =~ /main.*badShoes[[:space:]]*\(/s;