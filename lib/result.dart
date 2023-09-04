import 'package:flutter/material.dart';

import 'result_description.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final VoidCallback handleNewQuiz;

  const Result(
      {super.key, required this.totalScore, required this.handleNewQuiz});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text(
            'Набранно балов: ',
            style: TextStyle(fontSize: 25),
          ),
          Text(
            totalScore.toString(),
            style: const TextStyle(fontSize: 25),
          ),
        ]),
        Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 40,
            ),
            child: ResultDescription(
              totalScore: totalScore,
            )),
        TextButton(
          onPressed: handleNewQuiz,
          child: const Text(
            'Пройти тест еще раз',
            style: TextStyle(
                decoration: TextDecoration.underline,
                decorationColor: Colors.blueAccent,
                decorationThickness: 2),
          ),
        ),
      ],
    );
  }
}
