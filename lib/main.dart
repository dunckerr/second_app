import 'package:flutter/material.dart';

import './question.dart';

void main() {
  runApp(MyApp());
}

// generic (template)
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

// underscore makes _MyAppState private accessable from main.dart only
class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  // button callbacks
  void answerQuestion() {
    // setState takes anonymous func as an arg which is where the state is changed
    // NOTE setState just calls build() on MyAppState object which causes changes
    // due to changed state to be reflected/drawn.  this is optimised to only
    // redrawn stuff thats changed
    setState(() {
      _questionIndex = _questionIndex + 1;
      if (_questionIndex > 3) {
        _questionIndex = 0;
      }
    });
    print('answer chosen'); // WE SEE STRING IN DEBUIG CONSOLE
  }

  // overridden Missing concrete implementation of 'StatelessWidget.build'.
  // build only called on constrction for stateless widget, nothing changes
  // to rebuild obviously
  @override
  Widget build(BuildContext context) {
    // list
    var _questions = [
      'Whats your favourite color?',
      'favorite animal?',
      'xxxx',
      'yyyyy',
      'uuuu'
    ];

    // ctor named args like python
    return MaterialApp(
      // must use Text not String - it needs a widget NOT a string
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Second App'),
        ),
        body: Column(
          children: [
            Question(_questions[_questionIndex]),
            ElevatedButton(
              child: Text('Answer 1'),
              onPressed: answerQuestion, // NAMED CB FUNC()
            ),
            ElevatedButton(
              child: Text('Answer 2'),
              onPressed: () => answerQuestion(), //ANON CB FUNC
            ),
            ElevatedButton(
              child: Text('Answer 3'),
              onPressed: () => answerQuestion(), //ANON CB FUNC
            ),
          ],
        ),
      ),
    );
  }
}
