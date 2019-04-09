String majorCategory, major, salary, men, women, totalPeople, ratio;

class Grads {
  public Grads(String r) {
    String[] ar=r.split(",");
    major=ar[2];
    totalPeople=ar[3];
    men=ar[4];
    women=ar[5];
    majorCategory= ar[6];
    ratio=ar[7];
    salary=ar[15];
  }
  public String getMajor() {
    return major;
  }
  public String getMajorCategory() {
    return majorCategory;
  }
  public int getSalary() {
    return parseInt(salary);
  }
  public int getTotalPeople() {
    return parseInt(totalPeople);
  }
  public int getMen() {
    return parseInt(men);
  }
  public int getWomen() {
    return parseInt(women);
  }
  public float getRatio() {
    return parseFloat(ratio);
  }
}
