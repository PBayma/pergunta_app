import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final String texto;
  final Function() reiniciar;

  Result(this.texto, this.reiniciar);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            texto,
            style: TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
          ),
        ),
        FlatButton(
          child: Text(
            'Reiniciar Questionario',
            style: TextStyle(color: Colors.blue),
          ),
          onPressed: reiniciar,
        )
      ],
    );
  }
}
