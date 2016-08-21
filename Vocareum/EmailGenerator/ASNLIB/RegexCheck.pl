 
#!/bin/bash/perl
use strict;
use warnings;

my $program;
open(my $fh, '<', "$ARGV[0]/Work/EmailGenerator.java") or die "cannot open file AboutMe.java";
{
	local $/;
	$program = <$fh>;
}
close($fh);

print "1:true\n" if $program =~ /public[[:space:]]*class[[:space:]]*EmailGenerator/s;
print "2:true\n" if $program =~ /static[[:space:]]*void[[:space:]]*main[[:space:]]*\([[:space:]]*String[[:space:]]*(\[\])*[[:space:]]*[[:alnum:]]*[[:space:]]*(\[\])*[[:space:]]*\)/s;
print "3:true\n" if $program =~ /static[[:space:]]*String[[:space:]]*makeUserName[[:space:]]*\([[:space:]]*String[[:space:]]*[[:alnum:]]*,[[:space:]]*String[[:space:]]*[[:alnum:]]*[[:space:]]*\)/s;
print "4:true\n" if $program =~ /static[[:space:]]*String[[:space:]]*makeEmail[[:space:]]*\([[:space:]]*String[[:space:]]*[[:alnum:]]*,[[:space:]]*String[[:space:]]*[[:alnum:]]*[[:space:]]*\)/s;
print "5:true\n" if $program =~ /main.*Scanner[[:space:]]*[[:alnum:]]*[[:space:]]*=[[:space:]]*new[[:space:]]*Scanner[[:space:]]*\([[:space:]]*System\.in[[:space:]]*\)/s;
print "6:true\n" if (
	($program =~ /\.next\(\)/s) ||
	($program =~ /\.nextLine\(\)/s)
	);
print "7:true\n" if $program =~ /main.*makeUserName[[:space:]]*\(/s;
print "8:true\n" if $program =~ /main.*makeEmail[[:space:]]*\(/s;
print "9:true\n" if $program =~ /return.*return/s;
print "10:true\n" if (
	($program !~ /String[[:space:]]*[[:upper:]]([[:lower:]]|[[:digit:]])/s) && 
	($program !~ /int[[:space:]]*[[:upper:]]([[:lower:]]|[[:digit:]])/s) && 
	($program !~ /double[[:space:]]*[[:upper:]]([[:lower:]]|[[:digit:]])/s) && 
	($program !~ /Scanner[[:space:]]*[[:upper:]]([[:lower:]]|[[:digit:]])/s)
	);
#print "11:true\n" if $program !~ /;(?:[^\r\n]|\r(?!\n))*;/g;
print "12:true\n" if (
	($program !~ /{(?:[^\r\n]|\r(?!\n))*{/g) &&
	($program !~ /}(?:[^\r\n]|\r(?!\n))*}/g)
	);


