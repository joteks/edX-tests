import java.util.Scanner;

public class Associative {

	int a;
	int b;
	int c;

	public Associative(int a, int b, int c) {
		this.a = a;
		this.b = b;
		this.c = c;
	}

	public int firstTwo() {
		return (a + b) * c;
	}

	public int lastTwo() {
		return a + (b * c);
	}

	public static void main(String args[]) {
		Scanner read = new Scanner(System.in);
		System.out.println("Enter a: ");
		int a = read.nextInt();
		System.out.println("Enter b: ");
		int b = read.nextInt();
		System.out.println("Enter c: ");
		int c = read.nextInt();
		Associative ass = new Associative(a, b, c);
		System.out.println("Grouping the first two terms, (" + a + " + " + b + ") * " + c + " = " + ass.firstTwo());
		System.out.println("Grouping the first two terms, " + a + " + (" + b + " * " + c + ") = " + ass.lastTwo());
	}
}