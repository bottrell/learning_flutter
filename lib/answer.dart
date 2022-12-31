import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  // We will pass in a pointer to a function in main.dart.
  // voidcallback tells dart that the function we're passing
  // in doesn't take in any parameters and returns nothing
  final VoidCallback callbackfunction;
  final String answerText;

  const Answer(VoidCallback this.callbackfunction, String this.answerText, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
          ),
          child: Text('Answer 1'),
          onPressed: callbackfunction,
        ));
  }
}
