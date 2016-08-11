#!/bin/bash

#not extra credit
javac AboutMe.java
java AboutMe >& normresults.txt

#extra credit
java AboutMe >& ecresults.txt < "Robyn\nPurdue\n20\n"

#read results
norm=`cat normresults.txt`

#echo "$norm" | grep e '^.*[[:alnum:]]+[[:space:]]*.*My name is.*$' && test12=true;

#echo "$norm" | grep -e '^.*My name is [[:alpha:]]*, and I attend [[:alpha:]]*'\.' I am [[:digit:]]* years old'\.'.*$' && test13=true

extra=`cat ecresults.txt`

#echo "$norm" | grep e '^.*[[:alnum:]]+[[:space:]]*.*My name is.*$' && test14=true;

#echo "$norm" | grep -e '^.*My name is Robyn, and I attend Purdue'\.' I am 20 years old'\.'$' && test14=true && test13=true

perl CorrectCheck.pl $norm $extra