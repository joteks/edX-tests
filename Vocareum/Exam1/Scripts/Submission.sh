 
 
#/bin/bash!

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
            exit 1
        else
            echo 
            echo "Entity '$f' successful"
            echo 
        fi
    done
}

compiled=false

function checkCompiles()
{
    javac $1 &> compiled.txt
    compilerOutput=`cat compiled.txt`
    if ["$compilerOutput" = ""]; then
        echo "9:true" >> score.txt
        compiled=true
    else
        echo "9:false" >> score.txt
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

checkExists Work/Shoes.java

###################################

cd $work

perl $ASNLIB/RegexCheck.pl $(pwd) >> score.txt
 
###################################

checkCompiles Work/Shoes.java &> temp.txt

if [ "$compiled" = false ]; then
    finish
    exit 1
fi

###################################

cd Work

javac Shoes.java

java Shoes >& ../normresults.txt

cd ../

perl $ASNLIB/CorrectCheck.pl >> score.txt

###################################

finish
