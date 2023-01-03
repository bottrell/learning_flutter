import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;

  const Result(int this.resultScore, {Key key}) : super(key: key);

  //getter is like a method that can never recieve arguments
  String get resultPhrase {
    var resultText = "you did it!";
    if (resultScore <= 8) {
      resultText = "You are awesome and innocent!";
    } else if (resultScore <= 20) {
      resultText = "You are kind of corrupted";
    } else {
      resultText = "You are a certified psychopath!";
    }
    // always have to return something
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)));
  }
}
