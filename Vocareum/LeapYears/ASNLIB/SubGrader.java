 
import java.lang.Integer;
import java.util.Scanner;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.Arrays;
import voc.grader.*;
import java.lang.Math;

public class SubGrader {

	static String[] GROUPS = {
		"completion",
		"correctness",
		"style",
		"efficiency",
		"extracredit"
	};

	static double[] totals;

	//Change each project test cases, make sure checking for indentation is the last test case
	static Test[] tests = {
		new Test("LeapYear.java file exists", 0, 1), //0
		new Test("LeapYear class header", 0, 1),  //1
		new Test("Main method signature", 0, 1), //2
		new Test("isLeapYear method prototype", 0, 1), //3
		new Test("Main method created Scanner", 0, 1), //4
		new Test("Main method stored an int from standard input", 0, 1), //5
		new Test("Main method makes a call to isLeapYear", 0, 1), //6
		new Test("Used selection construct in main method", 0, 1), //7
		new Test("Printed statement in main method", 0, 1), //8
		new Test("Return statement exists", 0, 1), //9
		new Test("Uses camel casing", 2, 1), //10
		new Test("Blocks are well defined", 2, 1), //11
		new Test("One statement per line", 2, 1), //12
		new Test("LeapYear.java compiles", 0, 1), //13
		new Test("Prompts user for input", 1, 1), //14
		new Test("Output is correct: years divisible by 4", 1, 2), //15
		new Test("Output is correct: years divisible by 100", 1, 2), //16
		new Test("Output is correct: years divisible by 400", 1, 2), //17
		new Test("Output is correct: years not divisible by 4", 1, 2) //18
	};

	public static void main(String[] args) {

		double[] totals = new double[5];
		for (int i = 0; i < totals.length; i++) {
			totals[i] = 0.0;
		}
		String line;
		int testnum;

		try {

			File score = new File(args[0] + "/score.txt");
			Scanner read = new Scanner(score);

			while(read.hasNext()) {
				line = read.nextLine();
				testnum = Integer.parseInt(line.substring(0, line.indexOf(":")));
				if (line.contains("true")) {
					tests[testnum].passed = true;
					totals[tests[testnum].group] += tests[testnum].point;
				}
			}

			for (int i = 0; i < tests.length; i++) {
				if (!tests[i].passed) {
					System.out.println("Test Failed: " + tests[i].message);
				}
			}

			double finaltotal = 0;
			System.out.println();

			for (int i = 0; i < GROUPS.length; i++) {
				System.out.println(GROUPS[i] + ": " + totals[i]);
				finaltotal+=totals[i];
			}

			System.out.println("total: " + finaltotal);

		} catch (FileNotFoundException e) {
			System.out.println("Score.txt not found");
		}
		System.out.println();
      
      	//Vocareum Grader
      	Grader g = new Grader();
      	g.setReportOutput(1);
      	GradeInfo gi = new GradeInfo("Completion", (int)Math.round(totals[0]));
      	g.addGrade(gi);
      	gi = new GradeInfo("Correctness", (int)Math.round(totals[1]));
      	g.addGrade(gi);      
      	gi = new GradeInfo("Style", (int)Math.round(totals[2]));
      	g.addGrade(gi);
	}
  
    public static class Test {
  
      public String message;
      public double point;
      public int group;
      public boolean passed;
  
      public Test (String message, int group, double point) {
          this.message = message;
          this.group = group;
          this.point = point;
          passed = false;
      }
  	}
}
