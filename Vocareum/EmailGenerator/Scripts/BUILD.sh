#!/bin/bash
  
rm CompilerOutput.txt >& temp.txt

compile="$(javac EmailGenerator.java)" 

if [ "$compile" = "" ]; then
	echo "Compiled Successfully" > CompilerOutput.txt
else
	echo "$compile" > CompilerOutput.txt
fi

rm *.class
rm temp.txt