import 'package:flutter/material.dart';

import 'assets/constants.dart' as constants;

class QuizActions extends StatelessWidget {
  final int questionIndex;
  final Function handleAnswer;

  const QuizActions(
      {super.key, required this.questionIndex, required this.handleAnswer});

  @override
  Widget build(BuildContext context) {
    return Wrap(
        spacing: 20,
        crossAxisAlignment: WrapCrossAlignment.center,
        direction: Axis.vertical,
        children: [
          ...(constants.questions[questionIndex]['answers']
                  as List<Map<String, Object>>)
              .map((item) => ElevatedButton(
                    onPressed: () => handleAnswer(item['score'] as int),
                    child: Text(item['text'] as String),
                  ))
              .toList(),
        ]);
  }
}
