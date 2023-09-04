import 'package:flutter/material.dart';

import 'quiz_question.dart';
import 'quiz_actions.dart';

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
      QuizQuestion(questionIndex: questionIndex),
      QuizActions(questionIndex: questionIndex, handleAnswer: handleAnswer)
    ]);
  }
}
