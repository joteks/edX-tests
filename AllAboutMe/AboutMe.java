/**
 * Project 1, Topic 1: AboutMe.java
 * 
 * @author T. Copeland
 *
 */

public class AboutMe {
    private String name;
    private String school;
    private String age;

    public AboutMe(String name, String school, String age) {
        this.name = name;
        this.school = school;
        this.age = age;
    }

    public String myName() {
        return name;
    }

    public String mySchool() {
        return school;
    }

    public String myAge() {
        return age;
    }
    
    /**
     * @param args  name school age
     */

    public static void main(String[] args) {
        AboutMe me = new AboutMe(args[0], args[1], args[2]);
        
        System.out.println("My name is " + me.getName() + " and I attend "
                + me.getSchool() + ". I am " + me.getAge() + " years old.");
    }

}
