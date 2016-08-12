 import java.io.*;
import static java.lang.System.*;

import java.util.Scanner;
import java.lang.Math;
import java.util.*;

public class AboutMe{
  String myName () {
   String name = "Nithya";
   return name;
  }
  String mySchool () {
   String school = "homeschool";
   return school;
  }
  int myAge () {
   int age = 12;
   return age;
  }
  
  
  public static void main (String[] str) throws IOException {
   System.out.println("Hello");
   AboutMe m = new AboutMe();
   AboutMe s = new AboutMe();
   AboutMe a = new AboutMe();
   System.out.println("My name is " + m.myName() + ", and I attend " + s.mySchool() + ". I am " + a.myAge() + " years old.");
    
    
  } 

}