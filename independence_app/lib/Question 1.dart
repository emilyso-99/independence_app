// Flutter code sample for AppBar

// This sample shows an [AppBar] with two simple actions. The first action
// opens a [SnackBar], while the second action navigates to a new page.

import 'package:flutter/material.dart';
import 'package:independence_app/texttospeech.dart';
import 'login.dart';

/// This Widget is the main application widget.
class QuestionOne extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatelessWidget(),
    );
  }
}

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);

  String prompt1 =
      'Hello, this is the Independence Application. I am going to ask you a couple of questions about your health.';
  String prompt2 =
      "Please enter your Name and Medical ID Below so that your EHR can be retreived for today's session.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Welcome to Independence!'),
        actions: <Widget>[],
      ),
      body: Column(children: [
        Text(
          prompt1,
          style: TextStyle(fontSize: 30),
        ),
        Text(
          prompt2,
          style: TextStyle(fontSize: 30),
        ),
        RaisedButton(
          onPressed: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => new LoginScreen()));
          },
          child: Text("LOGIN"),
        ),
        TextToSpeech(
          text: prompt1 + prompt2,
        )
      ]),
    );
  }
}
