import 'package:flutter/material.dart';

class ResultScore extends StatelessWidget {
  final int totalScore;

  const ResultScore({
    super.key,
    required this.totalScore,
  });

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Text(
        'Набранно балов: ',
        style: TextStyle(fontSize: 25),
      ),
      Text(
        totalScore.toString(),
        style: const TextStyle(fontSize: 25),
      ),
    ]);
  }
}
