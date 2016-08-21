 
#!/bin/bash

rm *.txt >& temp.txt
rm *.class >& temp.txt
rm -rf Work >& temp.txt

mkdir Work

java -jar $LIB/jcp-6.0.0.jar --r --i:. --o:./Work &> temp.txt

 > score.txt

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
        echo "13:true" >> score.txt
        compiled=true
    else
        echo "13:false" >> score.txt
        compiled=false
    fi
}

function finish()
{
    cd $work
    javac -d . -cp .:$VLIB/java/voc-grader.jar:$VLIB/java/junit-4.12.jar:$VLIB/java/hamcrest-core-1.3.jar $ASNLIB/SubGrader.java
    java  -cp .:$VLIB/java/voc-grader.jar:$VLIB/java/junit-4.12.jar:$VLIB/java/hamcrest-core-1.3.jar SubGrader $(pwd)
    rm *.txt >& temp.txt
    rm *.class >& temp.txt
    rm -rf Work >& temp.txt
    rm temp.txt
}

###################################

checkExists Work/LeapYear.java

###################################

cd $work

perl $ASNLIB/RegexCheck.pl $(pwd) >> score.txt
if [ "$(grep ';.*;' LeapYears.java)" = "$(grep 'for.*;.*;' LeapYears.java)" ]; then
    echo 11:true >> score.txt
fi
 
###################################

checkCompiles Work/LeapYear.java &> temp.txt

if [ "$compiled" = false ]; then
    finish
    exit 1
fi

###################################

cd Work

javac LeapYear.java

java LeapYear >& ../normresults.txt < $ASNLIB/norminput.doc

java LeapYear >& ../ecresults.txt < $ASNLIB/ecinput.doc

java LeapYear >& ../ecresults2.txt < $ASNLIB/ecinput2.doc

java LeapYear >& ../ecresults3.txt < $ASNLIB/ecinput3.doc

cd ../

perl $ASNLIB/CorrectCheck.pl >> score.txt

###################################

finish

