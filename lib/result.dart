import 'package:flutter/material.dart';

import './score.dart';

class Result extends StatelessWidget {
  final Function resetHandler;
  final int totalScore;

  Result(this.resetHandler, this.totalScore);

  var results = [
    "Pretty boring.",
    "Not my type.",
    "You're an interesting person.",
    "You're awesome, lemme get yo digits!"
  ];

  String get resultPhrase {
    var resultText = 'you did it!';
    if (totalScore <= 10) {
      resultText = "Figure out a reason for living.";
    } else if (totalScore <= 15) {
      resultText = "Pretty boring.";
    } else if (totalScore <= 20) {
      resultText = "I might take you out for drinks...if you're buying.";
    } else if (totalScore <= 25) {
      resultText = "Wow, maybe we could be friends...";
    } else if (totalScore <= 30) {
      resultText = "We are 100% compatible. Let's get a room tonight.";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          Text(resultPhrase,
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
          RaisedButton(
            child: Text('Reset Quiz'),
            onPressed: resetHandler,
          ),
          Score(totalScore),
        ],
      ),
    );
  }
}
