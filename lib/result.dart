import 'package:flutter/material.dart';

import 'result_description.dart';
import 'result_actions.dart';
import 'result_score.dart';

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
        ResultScore(totalScore: totalScore),
        Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 40,
            ),
            child: ResultDescription(
              totalScore: totalScore,
            )),
        ResultActions(handleNewQuiz: handleNewQuiz)
      ],
    );
  }
}
