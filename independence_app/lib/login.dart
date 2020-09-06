import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'questions/Question 2.dart';
import "globals.dart";

class LoginScreen extends StatelessWidget {
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String> _authUser(LoginData data) {
    // print('Name: ${data.name}, Password: ${data.password}');
    // // this is where to check in Firebase
    // return Future.delayed(loginTime).then((_) {
    //   if (!users.containsKey(data.name)) {
    //     return 'Username not exists';
    //   }
    //   if (users[data.name] != data.password) {
    //     return 'Password does not match';
    //   }
    //   return null;
    // });
    Firestore.instance
        .collection("patient_info")
        .getDocuments()
        .then((querySnapshot) {
      querySnapshot.documents.forEach((result) {
        if (result.data["name"] == data.name) {
          GlobalData.medid = result.data["MedID"];
          GlobalData.username = result.data["name"];
          return null;
        }
      });
      {
        Firestore.instance.collection("patient_info").add({
          "name": data.name,
          "MedID": data.password,
        });
        GlobalData.username = data.name;
        GlobalData.medid = data.password;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'INDEPENDENCE',
      logo: 'assets/images/ecorp-lightblue.png',
      onLogin: _authUser,
      onSignup: _authUser,
      onSubmitAnimationCompleted: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => QuestionTwo()));
      },
      messages: LoginMessages(usernameHint: "NAME", passwordHint: "MedID"),
    );
  }
}
