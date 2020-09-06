import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter/material.dart';
import 'package:independence_app/speechtotext.dart';

class TextToSpeech extends StatefulWidget {

  TextToSpeech({Key key, this.text, this.listener}) : super(key: key);

  final bool listener;
  final String text;
  @override
  _TextToSpeechState createState() => _TextToSpeechState();

}

class _TextToSpeechState extends State<TextToSpeech> {
  final FlutterTts flutterTts = FlutterTts();
  TtsState ttsState = TtsState.playing;

  get isStopped => ttsState == TtsState.stopped;
  @override
  Widget build(BuildContext context) {
    
    speak() async{

      await flutterTts.speak(widget.text);

    }
    speak();
    if (widget.listener){
      return SpeechToText();
    }
    else{
      return Container();
    }
  }

  @override
  void dispose() {
    super.dispose();
    flutterTts.stop();
  }
}

enum TtsState { playing, stopped, paused, continued }