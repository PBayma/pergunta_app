import 'package:flutter/material.dart';
import 'package:questions_project/questionary.dart';
import 'package:questions_project/result.dart';

main() {
  runApp(PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  int _pontuacaoTotal = 0;
  String _suaClasse;

  List<Map<String, Object>> _perguntas = const [
    {
      'question': 'Qual sua cor favorita?',
      'answer': [
        {'texto': 'Azul', 'pontuacao': 10},
        {'texto': 'Vermelho', 'pontuacao': 5},
        {'texto': 'Verde', 'pontuacao': 3},
        {'texto': 'Branco', 'pontuacao': 1}
      ]
    },
    {
      'question': 'Qual seu elemento favorito?',
      'answer': [
        {'texto': 'Água', 'pontuacao': 10},
        {'texto': 'Fogo', 'pontuacao': 5},
        {'texto': 'Vento', 'pontuacao': 3},
        {'texto': 'Terra', 'pontuacao': 1}
      ]
    },
    {
      'question': 'Qual classe você se identifica?',
      'answer': [
        {'texto': 'Sacerdote', 'pontuacao': 10},
        {'texto': 'Mago', 'pontuacao': 5},
        {'texto': 'Ladino', 'pontuacao': 3},
        {'texto': 'Guerreiro', 'pontuacao': 1}
      ]
    }
  ];

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  String get suaClasse {
    if (_pontuacaoTotal <= 5) {
      return 'Guerreiro';
    } else if (_pontuacaoTotal <= 9) {
      return 'Ladino';
    } else if (_pontuacaoTotal <= 16) {
      return 'Mago';
    }
    return 'Sacerdote';
  }

  void _responder(int pontuacao) {
    setState(() {
      _perguntaSelecionada++;
      _pontuacaoTotal += pontuacao;
    });
    print(_pontuacaoTotal);
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionary(
                perguntaSelecionada: _perguntaSelecionada,
                perguntas: _perguntas,
                responder: _responder,
              )
            : Result(suaClasse, _reiniciarQuestionario),
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
