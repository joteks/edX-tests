#edX-tests
## Local
The Local directory contains portable files for each project. To run tests on any of the projects: 
   1. Navigate to a project directory (ex. Local/AllAboutMe)
   2. Replace the example student work with the work you want to test (ex. replace StudentWork/AllAboutMe.java with your AllAboutMe.java file)
   3. Navigate back to the project directory and run Submission.sh

## Vocareum
These are copies of the files that run on the Vocareum website for each project.
There is a directory for each project or exam inside this directory.
Submission.sh is the bash script that runs when a student submits an assignment and this script runs the perl scripts and java programs, it also check if the project exists and compiles and outputs those tests to score.txt
RegexCheck.pl is a perl script that runs regex checks against a project (wether is compiles or not) and outputs to score.txt
CorrectCheck.pl is a perl script that compiles the project, and runs the program with different inputs, then checks the output with regex then outputs to score.txt
Subgrader.java is a java program that defines all of the tests and processes score.txt then assigns the proper scores to the different categories

##ProjectAnswers
Solutions for all of the Vocareum projects

##Rubrics
Instructions and rubrics for all of the projects
