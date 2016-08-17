import java.util.Scanner;

public class EmailGenerator {
	
	public static String makeUserName(String first, String last) {
      if (last.length() > 7) {
        last = last.substring(0,7);
        first = first.substring(0,1);
      }
      if (last.length() < 7) {
        if (first.length() < 8-last.length()) {
          int x = last.length();
          for (int i = 0; i < 8-x-first.length(); i++) {
          	last = last + "x";
          }
        } else {
        	first = first.substring(0, 8-last.length());
        }
      }
		return (first + last).toLowerCase();
	}

	public static String makeEmail(String userName, String address) {
		return userName + "@" + address;
	}

	public static void main(String[] args) {
		Scanner read = new Scanner(System.in);
		System.out.println("Enter your first name: ");
		String first = read.nextLine();
		System.out.println("Enter your last name: ");
		String last = read.nextLine();
		String userName = makeUserName(first, last);
		System.out.println("This user's e-mail is: " + makeEmail(userName, "purdue.edu"));
	}
}