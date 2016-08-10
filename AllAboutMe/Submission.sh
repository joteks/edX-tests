rm score.txt
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

/bin/bash RegexCheck.sh . &> /dev/null

###################################

checkCompiles AboutMe.java

###################################

/bin/bash CorrectCheck.sh . &> /dev/null

###################################

javac SubGrader.java
java SubGrader

###################################