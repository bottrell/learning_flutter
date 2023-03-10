import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final Function(int) callback;
  final int currentIndex;
  final List<Map<String, Object>> questions;

  Quiz(List<Map<String, Object>> this.questions, Function(int) this.callback,
      int this.currentIndex,
      {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[currentIndex]["questionText"]),
        //RaisedButton is the legacy way to use a button
        ...(questions[currentIndex]["answers"] as List<Map<String, Object>>)
            .map((answer) => Answer(() => callback(answer['score']), answer['text']))
            .toList(),
      ],
    );
  }
}
