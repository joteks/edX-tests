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
     Scanner s = new Scanner(System.in);
     String mySchool = s.nextLine();
     
     System.out.println("What is your age?");
     Scanner a = new Scanner(System.in);
     int myAge= a.nextInt();
     
     AboutMe t = new AboutMe(myName, mySchool, myAge);
     
     
     System.out.println("Hello my name is " + t.myName() + ", and I attend " + t.mySchool() +  ". I am " + t.myAge() + " years old." );
     System.out.println("Thank you!");
   }
}
     
     

   
     
                                               
                        

                       
                        
  


     
  
                        