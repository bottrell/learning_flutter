import 'package:flutter/material.dart';
import './quiz.dart';
// want separate blocks between packages and our own personal files
import './question.dart'; // need a relative path
import './answer.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _currentIndex = 0;
  var _totalScore = 0;

  //passed in from score of answer
  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _currentIndex += 1;
    });
    if (_currentIndex < questions.length) {
      print("Answer chosen!");
    } else {
      print("no more questions!");
    }
  }

  // Hardcoding a list to pass into our column, this is a List of Maps of type <String, object>
  var questions = [
    {
      'questionText': "Whats your favorite color",
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 8},
        {'text': 'Blue', 'score': 6},
        {'text': 'White', 'score': 4}
      ]
    },
    {
      'questionText': "what's your favorite animal?",
      'answers': [
        {'text': 'Snake', 'score': 10},
        {'text': 'Elephant', 'score': 8},
        {'text': 'Lion', 'score': 6},
        {'text': 'turtle', 'score': 4}
      ]
    },
    {
      'questionText': "Where are you from?",
      'answers': [
        {'text': 'Michigan', 'score': 10},
        {'text': 'Kentucky', 'score': 8},
        {'text': 'Ohio', 'score': 6},
        {'text': 'Somewhere else', 'score': 4}
      ]
    }
  ];

  // decorator which is technically not required. We don't have the option of not overriding it,
  // but it's good for us to make it clear that we want to override it deliberately
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello, Flutter!'),
        ),
        // Column takes a list of Widgets as children
        body: _currentIndex < questions.length
            ? Quiz(questions, _answerQuestion, _currentIndex)
            : Result(_totalScore),
      ),
    );
  }
}
