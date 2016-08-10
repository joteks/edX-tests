#!/bin/bash

#not extra credit
javac AllAboutMe.java
java AllAboutMe >& normresults.txt

#extra credit
java AllAboutMe >& ecresults.txt < "Robyn\nPurdue\n20\n"

test12=true;
test13=false;
test14=false;

#read results
norm=`cat normresults.txt`

echo "$norm" | grep e '^.*[[:alnum:]]+[[:space:]]*.*My name is.*$' && test12=true;

echo "$norm" | grep -e '^.*My name is [[:alpha:]]*, and I attend [[:alpha:]]*'\.' I am [[:digit:]]* years old'\.'.*$' && test13=true

norm=`cat ecresults.txt`

echo "$norm" | grep e '^.*[[:alnum:]]+[[:space:]]*.*My name is.*$' && test14=true;

echo "$norm" | grep -e '^.*My name is Robyn, and I attend Purdue'\.' I am 20 years old'\.'$' && test14=true && test13=true

echo "12:$test13" >> score.txt
echo "13:$test14" >> score.txt
echo "14:$test15" >> score.txt