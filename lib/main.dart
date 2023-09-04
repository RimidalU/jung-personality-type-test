import 'package:flutter/material.dart';

import 'result.dart';
import 'quiz.dart';

import 'assets/constants.dart' as constants;

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Опросник Юнга',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade500),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  var _questionIndex = 0;
  var _totalScore = 0;

  void handleAnswer(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex++;
    });
  }

  void handleNewQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Опросник Юнга.'),
      ),
      body: Center(
          child: _questionIndex < constants.questions.length
              ? Quiz(questionIndex: _questionIndex, handleAnswer: handleAnswer)
              : Result(
                  handleNewQuiz: handleNewQuiz,
                  totalScore: _totalScore,
                )),
    );
  }
}
