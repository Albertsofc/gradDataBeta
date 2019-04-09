import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.TreeMap;
import java.util.Set;
import java.util.TreeSet;
import java.util.Scanner;
import java.util.Iterator;
import static java.lang.System.*;


public class GradMap {
  Set<String>categorySet;
  TreeMap<String, ArrayList <String>> theRealMap=new TreeMap<String, ArrayList <String>>();
  TreeMap<Integer, String> orderedMap=new TreeMap<Integer, String>();
  ArrayList<String> sortedList=new ArrayList<String>();
  Object setToArray[];
  ArrayList<String> majorList=new ArrayList<String>();

  public GradMap(String fileName) {
    try {
      scan=new Scanner(new File(fileName));
      int size=scan.nextInt();
      scan.nextLine();
      while (scan.hasNext()) {
        loadGrads(scan.nextLine());
      }
    }
    catch(Exception e) {
      println("unfortunately, "+e);
    }
  }
  public void loadGrads(String g) {
    //String major, 
    Grads grad=new Grads(g);
    ArrayList<String> theRest=new ArrayList<String>();
    theRest.add(grad.getMajorCategory());
    theRest.add(""+grad.getRatio());
    theRest.add(""+grad.getSalary());
    theRealMap.put(grad.getMajor(), theRest);
  }
  public float averageSalary(String majorCategory) {
    int totalSal=0;
    int salCount=0;
    float avSal=0;
    String majorCategoryLowercase=majorCategory;
    for (String s : theRealMap.keySet()) {
      String category=theRealMap.get(s).get(0);
      if (category.equals(majorCategoryLowercase)) {
        String sal=theRealMap.get(s).get(2);
        int addThisSal=parseInt(sal);
        totalSal+=addThisSal;
        salCount++;
      }
    }
    if (salCount!=0) {
      avSal=(totalSal/salCount);
    }
    return avSal;
  }
  public float averageRatio(String majorCategory) {
    float avRatio=0;
    float totalRatio=0;
    float ratioCount=0;
    String majorCategoryLowercase=majorCategory;//.toLowerCase();
    for (String s : theRealMap.keySet()) {
      String category=theRealMap.get(s).get(0);
      if (category.equals(majorCategoryLowercase)) {
        String indivRatio=theRealMap.get(s).get(1);
        float addThisRatio=parseFloat(indivRatio);
        if (addThisRatio>0) {
          totalRatio+=addThisRatio;
        }
        ratioCount++;
      }
    }
    if (ratioCount!=0) {
      avRatio=(totalRatio/ratioCount);
    } 
    return avRatio;
  }
  public Set getCategorySet() {
    categorySet=new TreeSet<String>();
    for (String s : theRealMap.keySet()) {
      categorySet.add(theRealMap.get(s).get(0));
    }
    return categorySet;
  }
  public ArrayList sortedBySalary() {
    setToArray=getCategorySet().toArray();
    for (Object s : setToArray) {
      String category=""+s;
      int salary=parseInt(averageSalary(category));
      orderedMap.put(salary, category);
    }
    for (int sal : orderedMap.keySet()) {
      sortedList.add(0, orderedMap.get(sal));
    }
    return sortedList;
  }
  public Object[] getSetArray(){
    return setToArray;
  }
  public ArrayList getSortedMajorSet(String majCat) {
    String majorCategory=majCat;
    for(Object major: theRealMap.keySet()){
      if(theRealMap.get(major).get(0).equals(majorCategory)){
        majorList.add(""+major);
      }
    }
    setToArray=getCategorySet().toArray();
    for (Object s : setToArray) {
      String category=""+s;
      int salary=parseInt(averageSalary(category));
      orderedMap.put(salary, category);
    }
    for (int sal : orderedMap.keySet()) {
      sortedList.add(0, orderedMap.get(sal));
    }
    return majorList;
  }
  public float getIndividualMajorRatio(String major){
    String maj=major;
    float ratio=parseFloat(theRealMap.get(maj).get(1)) ;
    return ratio;
  }  
  public float getIndividualMajorSalary(String major){
    String maj=major;
    float sal=parseInt(theRealMap.get(maj).get(2)) ;
    return sal;
  }
  
  
  public void bar(String majCat, float rat, int startingX, int startingY) {
    int startX=startingX+150;
    int startY=startingY;
    String category=majCat;
    float ratio=rat;
    fill(242,99,99);
    float endingOfFirst=(500.0*ratio);
    rect(startX, startY, endingOfFirst, 10, 300);
    fill(101,176,242);
    rect((endingOfFirst+startX), startY, (500-endingOfFirst), 10, 300);
    fill(0);
    textSize(15);
    fill(105);
    text(category, startingX-200, startingY+15);
    text("$"+parseInt(averageSalary(category)),startingX+700,startingY+15);
  }
  public void bar(String majCat, float rat, int startingX, int startingY,int salary) {
    int sal=salary;
    int startX=startingX+150;
    int startY=startingY;
    String category=majCat;
    float ratio=rat;
    fill(242,99,99);
    float endingOfFirst=(500.0*ratio);
    rect(startX, startY, endingOfFirst, 10, 300);
    fill(101,176,242);
    rect((endingOfFirst+startX), startY, (500-endingOfFirst), 10, 300);
    fill(0);
    textSize(15);
    fill(105);
    text(category, startingX-200, startingY+15);
    text("$"+sal,startingX+700,startingY+15);
  }
  public String toString() {
    return ""+theRealMap;
  }
}
