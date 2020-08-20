import 'package:deneyelim/models/student.dart';
import 'package:flutter/material.dart';

class StudentUpdate extends StatefulWidget{
  Student student;
  StudentUpdate(this.student);
  @override
  State<StatefulWidget> createState() {
    return _StudentUpdateState(student);
  }
}

class _StudentUpdateState extends State{
  Student student;
  _StudentUpdateState(this.student);

  @override
  var txtFirstName = new TextEditingController();
  var txtLastName = new TextEditingController();
  var txtpuan = new TextEditingController();



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
            buildPuanField(),
            buildSaveButton()
          ],
        ),
      ),
    );
  }

  TextField buildFirstNameField() {
    return TextField(
      decoration: InputDecoration(labelText: "Ad:", hintText: "buraya yazınız", ),
      controller: txtFirstName..text = student.firstName,

    );
  }
  buildLastNameField() {
    return TextField(
      decoration: InputDecoration(labelText: "Soyad:", hintText: "buraya yazınız"),
      controller: txtLastName..text = student.lastName,
    );
  }
  buildPuanField() {
    return TextField(
      decoration: InputDecoration(labelText: "Puan:", hintText: "buraya yazınız"),
      controller: txtpuan..text = student.grade.toString(),
    );
  }

  buildSaveButton() {
    return FlatButton(
      child: Text("Kaydet"),
      color: Colors.greenAccent,
      textColor: Colors.white,
      onPressed: (){
        student.firstName = txtFirstName.text;
        student.lastName = txtLastName.text;
        student.grade = int.tryParse(txtpuan.text );
        Navigator.pop(context);
      },
    );
  }
}

