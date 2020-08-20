import 'package:deneyelim/screens/student_add.dart';
import 'package:deneyelim/screens/student_update.dart';
import 'package:flutter/material.dart';

import 'models/student.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var selectedStudent = Student.withId(0,"", "", 0);
  var alertTitle = "İşlem sonucu";
  var message = "";
  List<Student> students = [];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Öğrenci Kayıt Sistemi",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.redAccent,
          centerTitle: true,
        ),
        body: buildBody(context));
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (BuildContext context, index) {
                  return ListTile(
                    title: Text(students[index].firstName +
                        " " +
                        students[index].lastName),
                    subtitle: Text("Puan: " + students[index].grade.toString()),
                    leading: Icon(Icons.account_circle),
                    trailing: Text(students[index].getStatus),
                    onTap: () {
                      setState(() {
                        selectedStudent = students[index];
                      });

                    },
                  );
                })),

        Text("seçili öğrenci: "+ selectedStudent.firstName +" "+ selectedStudent.lastName),
        Row(
            children: <Widget>[
            Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: buildResultButton(context),
          ),
            ]),
        Row(
          children: <Widget>[
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: buildAddButton(context),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: buildUpdateButton(context),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: buildDeleteButton(context),
            )
          ],
        ),
      ],
    );
  }

  Widget buildResultButton(BuildContext context) {
    return new RaisedButton(
      child: Text("Sonucu gör"),
      color: Colors.lightBlueAccent,
      textColor: Colors.white,
      onPressed: () {
        showDialog(
            context: context, builder: (BuildContext context) => showAlert(selectedStudent.getStatus));
      },
    );
  }
  Widget buildAddButton(BuildContext context) {
    return new RaisedButton(
      child: Text("Yeni Öğrenci"),
      color: Colors.greenAccent,
      textColor: Colors.white,
      onPressed: () {
         Navigator.push(
            context, MaterialPageRoute(builder: (context) => StudentAdd(students)));
         
      },

    );
  }
  Widget buildUpdateButton(BuildContext context) {
    return new RaisedButton(
      child: Text("Güncelle"),
      color: Colors.yellow,
      textColor: Colors.white,
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => StudentUpdate(selectedStudent)));
      },
    );
  }
  Widget buildDeleteButton(BuildContext context) {
    return new RaisedButton(
      child: Text("Sil"),
      color: Colors.redAccent,
      textColor: Colors.white,
      onPressed: () {
        setState(() {
          students.remove(selectedStudent);
        });
        showDialog(
            context: context, builder: (BuildContext context) => showAlert("Silindi"));

      },
    );
  }

  Widget showAlert(String value) {
    showMessage(value);
    var alert = AlertDialog(
      title: Text(alertTitle),
      content: Text(message),
      backgroundColor: renkSec(),
    );
    return alert;
  }

  renkSec() {
    if (selectedStudent.grade>50) {
      return Colors.greenAccent;
    } else {
      return Colors.redAccent;
    }
  }
  void showMessage(String value){
     message = value;
  }
}
