import java.lang.Integer;
import java.util.Scanner;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.Arrays;

public class Indentation {
	public static boolean assess(String file) {
		try {
			File aboutMe = new File(file);
			Scanner read = new Scanner(aboutMe);
			String line;
			boolean passed = true;
			//if the last line had a bracket
			boolean prev = false;
			//indentation of the last line
			int previous = 0;

			char c;
			int x;
			int spaces;
			while (read.hasNext()) {

				//get indentation
				x = 0;
				spaces = 0;
				
				line = read.nextLine();
				while (x < line.length() && (c = line.charAt(x)) == ' ') {
					spaces++;
					x++;
				}

				//if the last line had a bracket
				if (prev) {
					if (spaces <= previous) {
						passed = false;
						System.out.println(line);
					}
				}

				//check if this line has a bracket
				if (line.indexOf('{') != -1) {
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