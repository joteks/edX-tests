
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
        AboutMe Ati = new AboutMe("Ati", "West Lafayette High School", 15);
        System.out.println("My name is " + Ati.myName() + ", and I attend " + Ati.mySchool()
        + ". " + "I am " + Ati.myAge() + " years old.");
    }
}
