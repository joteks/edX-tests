/**

 * Topic 2, Project 2 : Associative.java

 * @author Joe Well

 * 

 */

//import scanner for user input
import java.util.Scanner;

//the one and only class
public class Associative
{
    //variables used to store user input
    int a;
    int b;
    int c;
    
    //class constructor to assign values to above variables
    Associative(int a, int b, int c)
    {
	//asign class varibles to their respective parameters
	this.a = a;
	this.b = b;
	this.c = c;
    }

    //returns the value of (a + b) * c
    int firstTwo()
    {
	return (a + b) * c;
    }

    //returns the value of a + (b * c)
    int lastTwo()
    {
	return a + (b * c);
    }

    //the main method
    public static void main(String[] args)
    {
	//create a new scanner object
	Scanner scan = new Scanner(System.in);
	
	//prompt user to enter 3 integers
	System.out.println("Please enter 3 integers");

	//create a new Associative object and pass the integers
	//the user entered as the constructor parameters
	Associative a = new Associative(scan.nextInt(), scan.nextInt(), scan.nextInt());

	//output the completed math problems
	//could have used one printf statement for each problem
	//but it would take up two lines and would not look very clean
	System.out.print("Grouping the first two terms");
	System.out.printf(" (%d + %d) * %d = %d \n",a.a, a.b, a.c, a.firstTwo());
        System.out.print("Grouping the last two terms");
	System.out.printf(" %d + (%d * %d) = %d \n",a.a, a.b, a.c, a.lastTwo());
    }
}