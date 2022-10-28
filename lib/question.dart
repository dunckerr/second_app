import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  // make final coz wont change
  final String questionText;

// positional arg store in questionText member
  Question(this.questionText);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        questionText,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
