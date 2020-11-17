import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final Function resetHandler;

  Result(this.resetHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          Text('You did it!'),
          RaisedButton(
            child: Text('Reset Quiz'),
            onPressed: resetHandler,
          )
        ],
      ),
    );
  }
}
