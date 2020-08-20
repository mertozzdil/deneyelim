import 'package:deneyelim/models/student.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StudentAdd extends StatefulWidget {
  List<Student> students;
  StudentAdd(this.students);

  @override
  State<StatefulWidget> createState() {
    return _StudentAddState(students);
  }
}

class _StudentAddState extends State {
  Student student = new Student.withoutInfo();
  List<Student> students;

  _StudentAddState(this.students);

  var txtFirstName = new TextEditingController();
  var txtLastName = new TextEditingController();
  var txtGrade = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni öğrenci ekle"),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            buildFirstNameField(),
            buildLastNameField(),
            buildGradeField(),
            buildSaveButton()
          ],
        ),
      ),
    );
  }

  TextField buildFirstNameField() {
    return TextField(
      decoration: InputDecoration(labelText: "Ad:", hintText: "buraya yazınız"),
      controller: txtFirstName,
    );
  }

  buildLastNameField() {
    return TextField(
      decoration:
          InputDecoration(labelText: "Soyad:", hintText: "buraya yazınız"),
      controller: txtLastName,
    );
  }

  buildGradeField() {
    return TextField(
      decoration:
          InputDecoration(labelText: "Puan:", hintText: "buraya yazınız"),
      controller: txtGrade,
    );
  }

  buildSaveButton() {
    return FlatButton(
      child: Text("Kaydet"),
      color: Colors.greenAccent,
      textColor: Colors.white,
      onPressed: () {
        student.firstName = txtFirstName.text;
        student.lastName = txtLastName.text;
        student.grade = int.tryParse(txtGrade.text);
        students.add(student);
        Navigator.pop(context);
      },
    );
  }
}
