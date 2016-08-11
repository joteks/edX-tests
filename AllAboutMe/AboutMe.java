
import java.util.Scanner;

/**

 * Topic 1, Project 1 : AboutMe.java

 * @author Aditi Acharya

 * 

 */
public class AboutMe
{
    String myName;
    String mySchool;
    int myAge;
    
    public AboutMe(String a, String b, int c )
    {
        this.myName = a;
        this.mySchool = b;
        this.myAge = c;
    }
    public String myName()
    {
        return myName;
    }
    public String mySchool()
    {
        return mySchool;
    }
    public int myAge()
    {
        return myAge;
    }
    public static void main(String[] args) {
        System.out.println("Hello");
        Scanner read = new Scanner(System.in);
        AboutMe ati = new AboutMe(read.nextLine(), read.nextLine(), read.nextInt());
        System.out.println("My name is " + ati.myName() + ", and I attend " + ati.mySchool()
        + ". " + "I am " + ati.myAge() + " years old.");
    }
}
