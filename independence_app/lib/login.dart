import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:independence_app/Question 2.dart';
import "globals.dart";

const users = const {
  'dribbble@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
};

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
          Navigator.push(GlobalData.context,
              MaterialPageRoute(builder: (context) => QuestionTwo()));
          print(result.data);
        } else {
          Firestore.instance.collection("patient_data").add({
            "name": data.name,
            "MedID": data.password,
          });
          GlobalData.username = data.name;
          GlobalData.medid = data.password;
          Navigator.push(GlobalData.context,
              MaterialPageRoute(builder: (context) => QuestionTwo()));
          print(result.data);
        }
        return null;
      });
    });
  }

  Future<String> _recoverPassword(String name) {
    print('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'Username not exists';
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    GlobalData.context = context;
    return FlutterLogin(
      title: 'INDEPENDENCE',
      logo: 'assets/images/ecorp-lightblue.png',
      onLogin: _authUser
      // onLogin: (_) => Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => QuestionTwo())),
      ,
      onSignup: null,
      // onSignup: (_) => Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => QuestionTwo())),
      onSubmitAnimationCompleted: () {},
      onRecoverPassword: _recoverPassword,
      messages: LoginMessages(usernameHint: "NAME", passwordHint: "MedID"),
      emailValidator: null,
    );
  }
}
