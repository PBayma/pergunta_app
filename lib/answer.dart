import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String _answer;
  final void Function() onSelected;

  Answer(this._answer, this.onSelected);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        textColor: Colors.white,
        color: Colors.blue,
        child: Text(_answer),
        onPressed: onSelected,
      ),
    );
  }
}
