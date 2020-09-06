import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'questions/Question 2.dart';
import "globals.dart";

class LoginScreen extends StatelessWidget {
  Duration get loginTime => Duration(milliseconds: 2250);

  // ignore: missing_return
  Future<String> _authUser(LoginData data) {
    Firestore.instance
        .collection("patient_info")
        .getDocuments()
        .then((querySnapshot) {
      querySnapshot.documents.forEach((result) {
        if (result.data["name"] == data.name) {
          GlobalData.medid = result.data["MedID"];
          GlobalData.username = result.data["name"];
          return null;
        } else {
          Firestore.instance.collection("patient_info").add({
            "name": data.name,
            "MedID": data.password,
          });
          GlobalData.username = data.name;
          GlobalData.medid = data.password;
          return null;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'INDEPENDENCE',
      logo: 'assets/images/ecorp-lightblue.png',
      onLogin: _authUser
      // onLogin: (_) => Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => QuestionTwo())),
      ,
      onSignup: _authUser,
      // onSignup: (_) => Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => QuestionTwo())),
      onSubmitAnimationCompleted: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => QuestionTwo()));
      },
      messages: LoginMessages(usernameHint: "NAME", passwordHint: "MedID"),
      onRecoverPassword: null,
    );
  }
}
