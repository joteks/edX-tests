import java.util.Scanner;

public class Regions {
	
	public static String getRegion(String state) {
		if (state.equals("ME") || state.equals("VT") || state.equals("NH") || state.equals("MA") || state.equals("CT") || state.equals("RI")) {
			return "New England";
		}
		if (state.equals("NY") || state.equals("NJ") || state.equals("DE") || state.equals("MD") || state.equals("VA") || state.equals("NC") || state.equals("SC")) {
			return "Atlantic";
		}
		if (state.equals("GA") || state.equals("FL") || state.equals("MS") || state.equals("AL") || state.equals("LA") || state.equals("TN")) {
			return "Southeast";
		}
		if (state.equals("PA") || state.equals("OH") || state.equals("MI") || state.equals("IN") || state.equals("IL") || state.equals("WI") || state.equals("MN") || state.equals("KY") || state.equals("WV") || state.equals("IA")) {
			return "Midwest";
		}
		if (state.equals("ND") || state.equals("SD") || state.equals("KS") || state.equals("NE") || state.equals("MO")) {
			return "Great Plains";
		}
		return "invalid";
	}

	public static void main(String[] args) {
		Scanner read = new Scanner(System.in);
		System.out.println("Enter a state abbreviation: ");
		String state = read.nextLine();
		String region = getRegion(state);
		if (region.equals("invalid")) {
			System.out.println("This is an invalid state abbreviation");
		}
		else {
			System.out.println("The state " + state + " is in the " + region + " region");
		}
	}
}