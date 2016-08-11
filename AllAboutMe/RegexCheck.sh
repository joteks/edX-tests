#!/bin/bash

perl RegexCheck.pl >> score.txt
 
wc -l AboutMe.java | grep -e "^.*[[:digit:]][[:digit:]] AboutMe.java.*$" && echo "10:true" >> score.txt