import java.lang.Integer;
import java.util.Scanner;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.Arrays;

public class SubGrader {

	static String[] GROUPS = {
		"completion",
		"correctness",
		"style",
		"efficiency",
		"extracredit"
	};

	static double[] totals;

	//ADD all files to check for indentation
	static String[] PROJECT = {"AboutMe.java"};

	//Change each project test cases, make sure checking for indentation is the last test case
	static Test[] tests = {
		new Test("AboutMe.java file exists", 0, 1), //0
		new Test("AboutMe class header", 0, 1),  //1
		new Test("Main method signature", 0, 1), //2
		new Test("myName method signature", 0, 0.5), //3
		new Test("mySchool method signature", 0, 0.5), //4
		new Test("myAge method signature", 0, 1), //5
		new Test("Main method uses myName, mySchool, and myAge method calls", 0, 2), //6
		new Test("Extra Credit: constructor signature", 4, 1), //7
		new Test("Extra Credit: use of 'this' and class variables", 4, 1), //8
		new Test("Uses camel casing", 2, 1), //9
		new Test("Blocks are well defined", 2, 1), //10
		new Test("AboutMe.java compiles", 0, 1), //11
		new Test("Main method greets user", 1, 1), //12
		new Test("Main method correct output", 1, 3), //13
		new Test("Extra Credit: correctly outputs information given", 4, 3), //14
		new Test("One statement per line", 2, 1) //15
	};

	public static void main(String[] args) {

		double[] totals = new double[5];
		for (int i = 0; i < totals.length; i++) {
			totals[i] = 0.0;
		}
		String line;
		int testnum;

		try {

			File score = new File("score.txt");
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
	}
}