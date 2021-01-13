import 'package:flutter/material.dart';
import 'package:questions_project/answer.dart';
import 'package:questions_project/question.dart';

main() {
  runApp(PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  List<Map<String, Object>> _perguntas = const [
    {
      'question': 'Qual sua cor favorita?',
      'answer': ['Azul', 'Vermelho', 'Verde', 'Branco']
    },
    {
      'question': 'Qual seu elemento favorito?',
      'answer': ['Água', 'Fogo', 'Vento', 'Terra']
    },
    {
      'question': 'Qual classe você se identifica?',
      'answer': ['Sacerdote', 'Mago', 'Ladino', 'Guerreiro']
    }
  ];

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
    print(_perguntaSelecionada);
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> answers = temPerguntaSelecionada
        ? _perguntas[_perguntaSelecionada]['answer']
        : null;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Column(
                children: [
                  Question(_perguntas[_perguntaSelecionada]['question']),
                  // Spread operator pra ele conseguir usar todos os elementos da lista naquele index.
                  ...answers.map((text) => Answer(text, _responder)).toList()
                ],
              )
            : Center(
                child: Text(
                  'Você é piroca',
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
              ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  State<PerguntaApp> createState() {
    return _PerguntaAppState();
  }
}
