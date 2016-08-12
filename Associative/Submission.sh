#!/bin/bash

if [ ! -e score.txt ]; then
    > score.txt
else
    rm score.txt
    > score.txt
fi

function checkExists()
{
    for f in $*; do
        if [ ! -e $f ]; then
            echo 
            echo "Entity '$f' does not exist"
            echo 
            echo "0:false" >> score.txt
            exit 1
		else
            echo 
			echo "Entity '$f' successful"
            echo 
            echo "0:true" >> score.txt
        fi
    done
}

compiled=false

function checkCompiles()
{
    javac $1 &> compiled.txt
    compilerOutput=`cat compiled.txt`
    if ["$compilerOutput" = ""]; then
        echo "11:true" >> score.txt
        compiled=true
    else
        echo "11:false" >> score.txt
        compiled=false
    fi
}

function finish()
{
    javac SubGrader.java
    java SubGrader
    rm *.txt
    rm *.class
}

###################################

checkExists Associative.java

###################################

perl RegexCheck.pl >> score.txt
 
wc -l Associative.java | grep -e "^.*[[:digit:]][[:digit:]] Associative.java.*$" &> /dev/null && echo "10:true" >> score.txt

###################################

checkCompiles Associative.java &> temp.txt

if [ "$compiled" = false ]; then
    finish
    exit 1
fi

###################################

javac Associative.java

java Associative >& normresults.txt < norminput.doc

java Associative >& ecresults.txt < ecinput.doc

perl CorrectCheck.pl >> score.txt

###################################

finish