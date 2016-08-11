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

function checkCompiles()
{
    javac $1 &> compiled.txt
    compilerOutput=`cat compiled.txt` &> /dev/null
    if ["$compilerOutput" = ""]; then
        echo "11:true" >> score.txt
    else
        echo "11:false" >> score.txt
        javac SubGrader.java
        java SubGrader
        exit 1
    fi
}

###################################

checkExists AboutMe.java

###################################

perl RegexCheck.pl >> score.txt
 
wc -l AboutMe.java | grep -e "^.*[[:digit:]][[:digit:]] AboutMe.java.*$" &> /dev/null && echo "10:true" >> score.txt

###################################

checkCompiles AboutMe.java

###################################

/bin/bash CorrectCheck.sh . &> /dev/null

###################################

javac SubGrader.java
java SubGrader

###################################