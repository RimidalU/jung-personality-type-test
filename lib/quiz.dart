import 'package:flutter/material.dart';

import 'quiz_actions.dart';

import 'assets/constants.dart' as constants;

class Quiz extends StatelessWidget {
  final int questionIndex;
  final Function handleAnswer;

  const Quiz({
    super.key,
    required this.questionIndex,
    required this.handleAnswer,
  });

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
          child: Text(
              style: const TextStyle(fontSize: 15),
              constants.questions[questionIndex]['question'] as String)),
      QuizActions(questionIndex: questionIndex, handleAnswer: handleAnswer)
    ]);
  }
}
