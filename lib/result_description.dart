import 'package:flutter/material.dart';

import 'assets/constants.dart' as constants;

class ResultDescription extends StatelessWidget {
  final int totalScore;

  const ResultDescription({super.key, required this.totalScore});

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
    return Text(
      textAlign: TextAlign.justify,
      constants.psychoTypes[determineType(totalScore)] as String,
    );
  }
}
