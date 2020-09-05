import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter/material.dart';

class TextToSpeech extends StatefulWidget {

  TextToSpeech({Key key, this.text}) : super(key: key);

  final String text;
  @override
  _TextToSpeechState createState() => _TextToSpeechState();

}

class _TextToSpeechState extends State<TextToSpeech> {
  final FlutterTts flutterTts = FlutterTts();
  @override
  Widget build(BuildContext context) {
    speak() async{

      await flutterTts.speak(widget.text);
    }
    return Container(
      alignment: Alignment.center,
      child: RaisedButton(child: Text(widget.text), onPressed: () => speak(),)
      
    );
  }
}