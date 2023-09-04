import 'package:flutter/material.dart';

class ResultActions extends StatelessWidget {
  final VoidCallback handleNewQuiz;

  const ResultActions({super.key, required this.handleNewQuiz});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: handleNewQuiz,
      child: const Text(
        'Пройти тест еще раз',
        style: TextStyle(
            decoration: TextDecoration.underline,
            decorationColor: Colors.blueAccent,
            decorationThickness: 2),
      ),
    );
  }
}
