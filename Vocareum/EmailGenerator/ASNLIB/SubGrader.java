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
		new Test("EmailGenerator.java file exists", 0, 1), //0
		new Test("EmailGenerator class header", 0, 1),  //1
		new Test("Main method signature", 0, 1), //2
		new Test("makeUserName method prototype", 0, 1), //3
		new Test("makeEmail method prototype", 0, 1), //4
		new Test("Main method created Scanner", 0, 1), //5
		new Test("Main method stored two Strings from standard input", 0, 2), //6
		new Test("Printed statement using makeUserName method call", 0, 1), //7
		new Test("Printed statement using makeEmail method call", 0, 1), //8
		new Test("Return statements exist", 0, 1), //9
		new Test("Uses camel casing", 2, 1), //10
		new Test("Blocks are well defined", 2, 1), //11
		new Test("One statement per line", 2, 1), //12
		new Test("EmailGenerator.java compiles", 0, 1), //13
		new Test("Prompts user for input", 1, 1), //14
		new Test("Output is correct", 1, 3), //15
		new Test("Extra Credit: shortens last name if too long", 4, 1), //16
		new Test("Extra Credit: adds first name if last name is too short", 4, 1), //17
		new Test("Extra Credit: adds characters to email if both names are too short", 4, 1) //18
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
      	gi = new GradeInfo("Extra Credit", (int)Math.round(totals[4]));
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
