#!/bin/bash

java -jar ./jcp-6.0.0.jar --r --i:./StudentWork --o:./Work &> temp.txt

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
        echo "17:true" >> score.txt
        compiled=true
    else
        echo "17:false" >> score.txt
        compiled=false
    fi
}

function finish()
{
    javac SubGrader.java
    java SubGrader
    rm *.txt
    rm *.class
    rm Work/*
}

###################################

checkExists Work/Associative.java

###################################

perl RegexCheck.pl >> score.txt
 
###################################

checkCompiles Work/Associative.java &> temp.txt

if [ "$compiled" = false ]; then
    finish
    exit 1
fi

###################################

cd Work

javac Associative.java

java Associative >& ../normresults.txt < ../norminput.doc

java Associative >& ../ecresults.txt < ../ecinput.doc

cd ../

perl CorrectCheck.pl >> score.txt

###################################

finish