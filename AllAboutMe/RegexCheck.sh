#!/bin/bash

test1=false;
test2=false;
test3=false;
test4=false;
test5=false;
test6=false;
test61=false;
test62=false;
test63=false;
test7=false;
test8=false;
test9=false;
test91=false;
test92=false;
test10=false;

program=`cat AboutMe.java`

echo "$program" | grep -e '^.*public[[:space:]]*class[[:space:]]*AboutMe.*$' && test1=true

echo "$program" | grep -e '^.*static[[:space:]]*void[[:space:]]*main[[:space:]]*'\('[[:space:]]*String'\[\]'[[:space:]]*args[[:space:]]*'\)'.*$' && test2=true

echo "$program" | grep -e '^.*String[[:space:]]*myName[[:space:]]*'\('[[:space:]]*'\)'.*$' && test3=true

echo "$program" | grep -e '^.*String[[:space:]]*mySchool[[:space:]]*'\('[[:space:]]*'\)'.*$' && test4=true

echo "$program" | grep -e '^.*int[[:space:]]*myAge[[:space:]]*'\('[[:space:]]*'\)'.*$' && test5=true

echo "$program" | grep -e '^.*[[:alnum:]]'\.'myName'\('.*'\)'.*$' && test61=true

echo "$program" | grep -e '^.*[[:alnum:]]'\.'mySchool'\('.*'\)'.*$' && test62=true

echo "$program" | grep -e '^.*[[:alnum:]]'\.'myAge'\('.*'\)'.*$' && test63=true

echo "$program" | grep -e '^.*AboutMe[[:space:]]*'\('[[:space:]]*String[[:space:]]*[[:alnum:]]*[[:space:]]*,[[:space:]]*String[[:space:]]*[[:alnum:]]*[[:space:]]*,[[:space:]]*int[[:space:]]*[[:alnum:]]*[[:space:]]*'\)'.*$' && test7=true

echo "$program" | grep -e '^.*this'\.'[[:alnum:]]*.*this'\.'[[:alnum:]]*.*this'\.'[[:alnum:]]*.*$' && test8=true

echo "$program" | grep -e '^.*String[[:space:]]*[[:lower:]][[:alnum:]]*[[:space:]]*;[[:space:]]*String[[:space:]]*[[:lower:]][[:alnum:]]*[[:space:]]*;[[:space:]]*int[[:space:]]*[[:lower:]][[:alnum:]]*[[:space:]]*;[[:space:]]*.*$' && test91=true

echo "$program" | grep -e '^.*AboutMe[[:space:]]*[[:lower:]][[:alnum:]]*[[:space:]]*=[[:space:]]*new[[:space:]]*AboutMe[[:space:]]*'\('.*$' && test92=true
 
wc -l AboutMe.java | grep -e "^.*[[:digit:]][[:digit:]] AboutMe.java.*$" && test10=true

if [ "$test61"="true" ] && [ "$test62"="true" ] && [ "$test63"="true" ]; then
	test6=true;
fi

if [ "$test91"="true" ] && [ "$test92"="true" ]; then
	test9=true;
fi

echo "1:$test1" >> score.txt
echo "2:$test2" >> score.txt
echo "3:$test3" >> score.txt
echo "4:$test4" >> score.txt
echo "5:$test5" >> score.txt
echo "6:$test6" >> score.txt
echo "7:$test7" >> score.txt
echo "8:$test8" >> score.txt
echo "9:$test9" >> score.txt
echo "10:$test10" >> score.txt
