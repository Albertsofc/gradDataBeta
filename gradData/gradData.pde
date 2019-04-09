import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import java.util.Collections;
import static java.lang.System.*;
import java.util.Map;
import java.util.TreeMap;
import java.util.Set;
import java.util.TreeSet;
import java.util.Iterator;


Scanner scan;
int size;
int X;
int Y;
int scene;
String putInScene;
GradMap gradMap=new GradMap("Desktop/gradData/gradData.txt");

void setup() {
  //println(gradMap); 
  size(1200, 900);
  background(242, 195, 155);
  putInScene="basic";
  gradMap.sortedBySalary();
  //if (mousePressed) {
   // sceneCategory(putInScene);
  //}
}

void draw() {
  background(255);
  int startingX=100;
  int startingY=100;
  noStroke();
  fill(235);
  sceneCategory(putInScene);
}

void sceneCategory(String category) {
  int startX=240;
  int startY=200;
  textSize(20);
  fill(105);
  if (!putInScene.equals("basic")) {
    text("This data shows the male:female ratio in the academic field of " +category+".", 100, 130);
    for (Object major: gradMap.getSortedMajorSet(category)) {//this stuff is wrong
      String maj=major.toString();
      gradMap.bar(maj, gradMap.getIndividualMajorRatio(maj), startX, startY,parseInt(gradMap.getIndividualMajorSalary(maj)));
      startY+=50;
    }
  } else {
    int startingX=240;
    int startingY=200;
    textSize(70);
    fill(81, 85, 165);
    text("GradData", 50, 80);
    textSize(20);
    text("This data shows the male:female ratio in 18 college major categories. Click on a category to find ratios within\nindividual majors. pink=women, blue=men.", 100, 130);
    textSize(15);
    text("Average Salary",907,178);
    for (Object majorCategory : gradMap.sortedBySalary()) {
      String majCat=majorCategory.toString();
      gradMap.bar(majCat, gradMap.averageRatio(majCat), startingX, startingY);
      startingY+=45;
    }
  }
}
void mouseClicked() {
  X=mouseX;
  Y=mouseY;
  if (Y>193&&Y<226) {
    putInScene="Engineering";
  } else if (Y>225&&Y<275) {
    putInScene="Business";
  } else if (Y>274&&Y<323) {
    putInScene="Computers & Mathematics";
  } else if (Y>322&&Y<366) {
    putInScene="Law & Public Policy";
  } else if (Y>365&&Y<412) {
    putInScene="Physical Sciences";
  } else if (Y>411&&Y<456) {
    putInScene="Social Sceince";
  } else if (Y>455&&Y<506) {
    putInScene="Agriculture & Natural Resources";
  } else if (Y>505&&Y<543) {
    putInScene="Health";
  } else if (Y>542&&Y<591) {
    putInScene="Biology & Life Science";
  } else if (Y>590&&Y<637) {
    putInScene="Industrial Arts & Consumer Services";
  } else if (Y>636&&Y<683) {
    putInScene="Interdisciplinary";
  } else if (Y>682&&Y<726) {
    putInScene="Communications & Journalism";
  } else if (Y>725&&Y<771) {
    putInScene="Arts";
  } else if (Y>770&&Y<821) {
    putInScene="Education";
  } else if (Y>820&&Y<863) {
    putInScene="Humanities & Liberal Arts";
  } else if (Y>862&&Y<901) {
    putInScene="Psychology & Social Work";
  }
  else{
    putInScene="basic";
  }
}
