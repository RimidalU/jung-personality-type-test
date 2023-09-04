import 'package:flutter/material.dart';

import 'assets/constants.dart' as constants;

class QuizQuestion extends StatelessWidget {
  final int questionIndex;

  const QuizQuestion({super.key, required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
      child: Text(
          style: const TextStyle(fontSize: 15),
          constants.questions[questionIndex]['question'] as String),
    );
  }
}
