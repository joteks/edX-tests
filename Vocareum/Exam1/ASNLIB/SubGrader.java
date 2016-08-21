 
 
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
		new Test("First statement exists", 0, 1),  //0
		new Test("Second statement exists", 0, 1), //1
		new Test("One method return statement exists", 0, 1), //2
		new Test("Both method return statements exist", 0, 1), //3
		new Test("Created a Shoes object", 0, 1), //4
		new Test("Printed one statements", 0, 1), //5
		new Test("Printed two statements", 0, 1), //6
		new Test("Main method call to goodShoes", 0, 1), //7
		new Test("Main method call to badShoes", 0, 1), //8
		new Test("Shoes.java compiles", 0, 1), //9
		new Test("Output is correct: goodShoes", 1, 1), //10
		new Test("Output is correct: badShoes", 1, 1), //11
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
