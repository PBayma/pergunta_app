import 'package:flutter/material.dart';

import 'answer.dart';
import 'question.dart';

class Questionary extends StatelessWidget {
  final List perguntas;
  final int perguntaSelecionada;
  final void Function(int) responder;

  Questionary({
    @required this.perguntas,
    @required this.perguntaSelecionada,
    @required this.responder,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> answers = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada]['answer']
        : null;
    return Column(
      children: [
        Question(perguntas[perguntaSelecionada]['question']),
        // Spread operator pra ele conseguir usar todos os elementos da lista naquele index.
        ...answers
            .map((resp) =>
                Answer(resp['texto'], () => responder(resp['pontuacao'])))
            .toList()
      ],
    );
  }
}
