/**

 * Topic 2, Project 1 : Associative.java

 * @author Jesse Batronis

 * 

 */

import java.util.Scanner;

public class Associative {
    
  public static void main (String[] args) {
      System.out.println("Please provide three real numbers");
      Scanner s = new Scanner(System.in);
      int x = s.nextInt();
      int y = s.nextInt();
      int z = s.nextInt();
    
      int firstTwo = (x+y)*z;
      System.out.println(firstTwo);
  
      int lastTwo = x+(y*z);
      System.out.println(lastTwo);
  
  
  
  
  
  
  
  
  }
}