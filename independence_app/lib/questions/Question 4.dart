// Flutter code sample for AppBar

// This sample shows an [AppBar] with two simple actions. The first action
// opens a [SnackBar], while the second action navigates to a new page.

import 'package:flutter/material.dart';
import 'package:independence_app/globals.dart';
import 'package:independence_app/texttospeech.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: QuestionFour(),
    );
  }
}

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));

/// This is the stateless widget that the main application instantiates.
class QuestionFour extends StatelessWidget {
  QuestionFour({Key key}) : super(key: key);

  String prompt =
      'Have you taken all your prescribed medications and supplements today?\n';

  @override
  Widget build(BuildContext context) {
    GlobalData.question = 4;
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: const Text('Please answer the following question:'),
          actions: <Widget>[],
        ),
        body: new Center(
          child: new Column(children: [
            Text(
              prompt,
              style: GoogleFonts.oswald(
                  textStyle: TextStyle(
                      color: Colors.black, letterSpacing: .5, fontSize: 36)),
              textAlign: TextAlign.center,
            ),
            TextToSpeech(
              text: prompt,
              listener: true,
            )
          ]),
        ));
  }
}
