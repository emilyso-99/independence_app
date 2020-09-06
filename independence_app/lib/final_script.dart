import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import "globals.dart";

class FinalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Firestore.instance
        .collection("contact_info")
        .getDocuments()
        .then((querySnapshot) {
      querySnapshot.documents.forEach((result) {
        if (result.data["name"] == GlobalData.username) {
          GlobalData.contact = result.data["contact"];
          GlobalData.number = result.data["number"];
          return new Scaffold(
              body: SingleChildScrollView(
                  child: Column(
            children: [
              Text("Your responses have been sent to your person of contact.",
                  textAlign: TextAlign.center),
              Text(result.data["number"]),
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
      });
    });
    return new Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        Text(
            "Your responses have been sent to your person of contact, Dana, at 700-657-891.",
            textAlign: TextAlign.center,
            style: GoogleFonts.oswald(
                textStyle: TextStyle(
                    color: Colors.black, letterSpacing: .5, fontSize: 30))),
        Text("Question 1",
            textAlign: TextAlign.center,
            style: GoogleFonts.oswald(
                textStyle: TextStyle(
                    color: Colors.blue,
                    letterSpacing: .5,
                    fontSize: 24,
                    fontWeight: FontWeight.w500))),
        Text(GlobalData.Question2,
            textAlign: TextAlign.center, style: TextStyle(fontSize: 20)),
        Text("Question 2",
            textAlign: TextAlign.center,
            style: GoogleFonts.oswald(
                textStyle: TextStyle(
                    color: Colors.blue,
                    letterSpacing: .5,
                    fontSize: 24,
                    fontWeight: FontWeight.w500))),
        Text(GlobalData.Question3,
            textAlign: TextAlign.center, style: TextStyle(fontSize: 20)),
        Text("Question3",
            textAlign: TextAlign.center,
            style: GoogleFonts.oswald(
                textStyle: TextStyle(
                    color: Colors.blue,
                    letterSpacing: .5,
                    fontSize: 24,
                    fontWeight: FontWeight.w500))),
        Text(GlobalData.Question4,
            textAlign: TextAlign.center, style: TextStyle(fontSize: 20)),
        Text("Question 4",
            textAlign: TextAlign.center,
            style: GoogleFonts.oswald(
                textStyle: TextStyle(
                    color: Colors.blue,
                    letterSpacing: .5,
                    fontSize: 24,
                    fontWeight: FontWeight.w500))),
        Text(GlobalData.Question5,
            textAlign: TextAlign.center, style: TextStyle(fontSize: 20)),
        Text("Question 5",
            textAlign: TextAlign.center,
            style: GoogleFonts.oswald(
                textStyle: TextStyle(
                    color: Colors.blue,
                    letterSpacing: .5,
                    fontSize: 24,
                    fontWeight: FontWeight.w500))),
        Text(GlobalData.Question6,
            textAlign: TextAlign.center, style: TextStyle(fontSize: 20))
      ],
    )));
  }
}
