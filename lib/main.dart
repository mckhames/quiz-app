import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';
import './score.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  final _questions = const [
    {
      "questionText": "What's your favorite color?",
      "answers": [
        {"text": "Red", "score": 7},
        {"text": "Green", "score": 10},
        {"text": "Blue", "score": 5},
        {"text": "Black", "score": 3},
      ]
    },
    {
      "questionText": "What's your favorite animal?",
      "answers": [
        {"text": "Dog", "score": 7},
        {"text": "Cat", "score": 10},
        {"text": "Giraffe", "score": 8},
        {"text": "Elephant", "score": 10},
      ]
    },
    {
      "questionText": "What's your favorite season?",
      "answers": [
        {"text": "Summer", "score": 3},
        {"text": "Winter", "score": 10},
        {"text": "Fall", "score": 7},
        {"text": "Spring", "score": 5},
      ]
    },
  ];

  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
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
        body: _questionIndex < _questions.length
            ? Column(children: [
                Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                ),
                Score(_totalScore),
              ])
            : Result(_resetQuiz, _totalScore),
      ),
    );
  }
}
