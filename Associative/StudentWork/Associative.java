import java.util.Scanner;
/*
 * Topic 2; Project 2; Week 7;
 *@Aaron Haas 
 *
*/

public class Associative {
  int x;
  int y;
  int z;
  Associative (int x, int y, int z) {
    this.x = x;
    this.y = y;
    this.z = z;
  }
  int firstTwo () {
   return (x+y)*z; 
  }
  int lastTwo () {
   return x+(y*z); 
  }
  public static void main(String[] args) {
   System.out.println("Please give me 3 integers."); 
   Scanner w = new Scanner(System.in);
   int a = w.nextInt();
   int b = w.nextInt();
   int c = w.nextInt();
   Associative d = new Associative(a, b, c);
   System.out.println("Thank you for the integers now here is your output: "+d.firstTwo());
   System.out.println(", and here is your second output: "+d.lastTwo());
  }
}