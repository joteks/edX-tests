package course;
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
        myName = a;
        mySchool = b;
        myAge = c;
    }
    public String getName()
    {
        return myName;
    }
    public String getSchool()
    {
        return mySchool;
    }
    public int getAge()
    {
        return myAge;
    }
    public static void main(String[] args) 
    {
        AboutMe Ati = new AboutMe("Ati", "West Lafayette High School", 15);
        System.out.println("My name is " + Ati.getName() + ", and I attend " + Ati.getSchool()
        + ". " + "I am " + Ati.getAge() + " years old.");
    }
}
