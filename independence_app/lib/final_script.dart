import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import "globals.dart";

class FinalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var contact;
    var number;
    Firestore.instance
        .collection("contact_info")
        .getDocuments()
        .then((querySnapshot) {
      querySnapshot.documents.forEach((result) {
        print(GlobalData.username);
        if (result.data["name"] == GlobalData.username) {
          contact = result.data["contact"];
          number = result.data["phone"];
          print(result.data["contact"]);
        }
      });
    });
    return new Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        Text('We are sending this script to your contact' +
            contact +
            ', at' +
            number),
        Text("Question 1", textAlign: TextAlign.center),
        Text(GlobalData.Question2, textAlign: TextAlign.center),
        Text("Question 2", textAlign: TextAlign.center),
        Text(GlobalData.Question3, textAlign: TextAlign.center),
        Text("Question3", textAlign: TextAlign.center),
        Text(
          GlobalData.Question4,
          textAlign: TextAlign.center,
        ),
        Text("Question 4", textAlign: TextAlign.center),
        Text(GlobalData.Question5, textAlign: TextAlign.center),
        Text(
          "Question 5",
          textAlign: TextAlign.center,
        ),
        Text(GlobalData.Question6, textAlign: TextAlign.center)
      ],
    )));
  }
}
