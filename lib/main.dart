import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  final questions = const [
    {
      "questionText": "What's your favorite color?",
      "answers": ["Red", "Green", "Blue", "Yellow"],
    },
    {
      "questionText": "What's your favorite animal?",
      "answers": ["Dog", "Cat", "Rhino", "Elephant"],
    },
    {
      "questionText": "What's your favorite season?",
      "answers": ["Spring", "Summer", "Fall", "Winter"],
    }
  ];

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      print('Quiz has restarted!');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('My First App'),
            backgroundColor: Colors.green,
          ),
          body: _questionIndex < questions.length
              ? Column(
                  children: [
                    Question(
                      questions[_questionIndex]['questionText'],
                    ),
                    ...(questions[_questionIndex]['answers'] as List<String>)
                        .map((answer) {
                      return Answer(_answerQuestion, answer);
                    }).toList()
                  ],
                )
              : Result(_resetQuiz)),
    );
  }
}
