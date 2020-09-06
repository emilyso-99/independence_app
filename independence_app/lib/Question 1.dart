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

  String prompt1 = '';
//      'I am going to ask you a couple of questions about your health.';
  String prompt2 = '';
//      "Please enter your Name and Medical ID on the next page so that your EHR can be retrieved for today's session.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Welcome!'),
        actions: <Widget>[],
      ),
      body: Container(
        decoration: BoxDecoration (
          gradient: LinearGradient (
            colors: [Colors.white, Color(0xffd6ffef)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )
        ),
        padding: EdgeInsets.all(10),
        child: Column(children: [
          Padding(padding: EdgeInsets.all(65)),
          Image (
            image: AssetImage('assets/land.png'),
          ),
          Padding(padding: EdgeInsets.all(10)),
          Text(
            'Independence',
            style: TextStyle(fontSize: 30),
            textAlign: TextAlign.center,
          ),
          Padding(padding: EdgeInsets.all(70)),
          Row (
            children: <Widget>[
              Expanded (
                flex: 2,
                child: Container (
                    child: Divider(
                      color: Color(0xff5e8075),
                      height: 2,
                      thickness: 3,
                      indent: 12,
                      endIndent: 12,
                    )
                )
              ),
              Expanded (
                  flex: 5,
                  child: Container (
                      child: Text(
                        'To conduct the checkup',
                        style: TextStyle(fontSize: 17),
                        textAlign: TextAlign.center,
                      )
                    )
              ),
              Expanded (
                  flex: 2,
                  child: Container (
                      child: Divider(
                        color: Color(0xff5e8075),
                        height: 2,
                        thickness: 3,
                        indent: 12,
                        endIndent: 12,
                      )
                  )
              )
            ]
          ),
         ButtonTheme (
          minWidth: 220,
          height: 40,
          child: RaisedButton(
              onPressed: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => new LoginScreen()));
              },
              child: Text(
                  "LOGIN",
                  style: TextStyle(fontSize: 20)
              ),
              color: Color(0xffa9c9c0),
              shape: RoundedRectangleBorder (
                  borderRadius: BorderRadius.circular(20)
              )
          ),
        ),

         TextToSpeech(
          text: prompt1 + "..." + prompt2, listener: false
        ),
      ]),
    )
    );
  }
}
