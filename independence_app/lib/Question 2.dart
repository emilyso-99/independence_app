// Flutter code sample for AppBar

// This sample shows an [AppBar] with two simple actions. The first action
// opens a [SnackBar], while the second action navigates to a new page.

import 'package:flutter/material.dart';
import 'package:independence_app/speechtotext.dart';
import 'package:independence_app/texttospeech.dart';
import 'package:google_fonts/google_fonts.dart';

/// This Widget is the main application widget.
class QuestionTwo extends StatelessWidget {
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

  String prompt = "Are you currently hurt or experiencing new or worse pain?";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: const Text('Welcome to Independence'),
          actions: <Widget>[],
        ),
        body: new Center(
          child: new Column(children: [
            Text(
              "Are you currently hurt or experiencing new or worse pain?",
              style: GoogleFonts.oswald(
                  textStyle: TextStyle(
                      color: Colors.black, letterSpacing: .5, fontSize: 30)),
            ),
            TextToSpeech(text: prompt, listener: true),
          ]),
        ));
  }
}
