import 'package:flutter/material.dart';

// want separate blocks between packages and our own personal files
import './question.dart'; // need a relative path
import './answer.dart';


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

  void _answerQuestion() {
    setState(() {
      _currentIndex += 1;
    });
    print("Answer chosen!");
  }

  // Hardcoding a list to pass into our column, this is a List of Maps of type <String, object>
  var questions = [
    {
      'questionText': "Whats your favorite color", 
      'answers': ['Black', 'Red', 'Blue', 'White']
    },
    {
      'questionText': "what's your favorite animal?", 
      'answers': ['Snake', 'Elephant', 'Lion', 'turtle']
    },
    {
      'questionText': "Where are you from?", 
      'answers': ['Michigan', 'Kentucky', 'Ohio', 'Somewhere else']
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
        body: Column(
          children: [
            Question(questions[_currentIndex]["questionText"]),
            //RaisedButton is the legacy way to use a button
            (questions[_currentIndex]["answers"] as List<String>).map(
              (answer) => Answer(_answerQuestion, answer)
            ).toList(),
          ],
        ),
      ),
    );
  }
}
