/**
 * Topic 1, Project 1 : AboutMe.java
 * @author AUDREYOTT
 * 
 */
import java.util.Scanner;
public class AboutMe {
  
  String myName;
  String mySchool;
  int myAge;
  
  AboutMe (String myName, String mySchool, int myAge){
    this.myName = myName;
    this.mySchool = mySchool;
    this.myAge = myAge;
  }
    
  
  public String myName(){
    return myName;
  }
  public String mySchool() {
    return mySchool;
  }
  public int myAge() {
    return myAge;
  }
   public static void main (String[] args){
     System.out.println("Hello!");
     
     System.out.println("Please enter your name.");
     Scanner n = new Scanner(System.in);
     String myName = n.nextLine();
     
     System.out.println("What school do you attend?");
     String mySchool = n.nextLine();
     
     System.out.println("What is your age?");
     int myAge= n.nextInt();
     
     AboutMe t = new AboutMe(myName, mySchool, myAge);
     
     
     System.out.println("My name is " + t.myName() + ", and I attend " + t.mySchool() +  ". I am " + t.myAge() + " years old." );
     System.out.println("Thank you!");
   }
}
     
     

   
     
                                               
                        

                       
                        
  


     
  
                        