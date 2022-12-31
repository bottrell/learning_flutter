import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  // this needs to be final here, because dart and flutter implement classes differently
  final String questionText; // this will be passed in from main.dart
  Question(this.questionText, {Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(questionText,
      style: TextStyle(fontSize: 28),
      textAlign: TextAlign.center
      ),
    );
  }
}
