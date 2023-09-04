import 'package:flutter/material.dart';
import 'assets/constants.dart' as constants;

class Result extends StatelessWidget {
  final int totalScore;
  final VoidCallback handleNewQuiz;

  const Result(
      {super.key, required this.totalScore, required this.handleNewQuiz});

  String determineType(totalScore) {
    if (totalScore <= 35) {
      return 'introvert';
    } else if (totalScore >= 66) {
      return 'extravert';
    } else {
      return 'ambivert';
    }
  }

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
          child: Text(
            textAlign: TextAlign.justify,
            constants.psychoTypes[determineType(totalScore)] as String,
          ),
        ),
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
