import 'package:flutter/material.dart';

class Score extends StatelessWidget {
  final int getScore;
  Score(this.getScore);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        height: 50,
        color: Colors.red,
        child: Center(
          child: Text(
            'Your score is $getScore',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
