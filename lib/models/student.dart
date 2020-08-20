class Student{
  int id;
  String firstName;
  String lastName;
  int grade;
  String _status;

  Student(this.firstName, this.lastName, this.grade);
  Student.withId(this.id, this.firstName, this.lastName, this.grade);
  Student.withoutInfo();

  String get getStatus{
    if (grade > 50) {
      return "Geçti";
    } else {
      return "Kaldı";
    }
  }
}