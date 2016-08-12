import java.lang.Integer;
import java.util.Scanner;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.Arrays;

public class Indentation {
	public static boolean assess(String file) {
		try {
			File myfile = new File(file);
			Scanner read = new Scanner(myfile);
			String line;
			boolean passed = true;
			//if the last line had a bracket
			boolean prev = false;
			//indentation of the last line
			int previous = 0;

			char c;
			int x;
			int spaces;
			boolean blankline;
			while (read.hasNext()) {

				//get indentation
				x = 0;
				spaces = 0;
				blankline = false;
				
				line = read.nextLine();
				while (x < line.length() && (c = line.charAt(x)) == ' ') {
					spaces++;
					x++;
				}
				if (x == line.length() && prev) {
					blankline = true;
					prev = false;
					spaces = previous;
				}

				//if the last line had a bracket
				if (prev) {
					if (spaces <= previous) {
						System.out.println("INDENTATION FAILED");
						System.out.println(line);
						passed = false;
					}
				}

				//check if this line has a bracket
				if (line.indexOf('{') != -1 || blankline) {
					prev = true;
				} else {
					prev = false;
				}

				previous = spaces;
			}
			return passed;
		} catch (FileNotFoundException e) {
			return false;
		}
	}
}