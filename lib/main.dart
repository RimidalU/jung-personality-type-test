import 'package:flutter/material.dart';
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

  String determineType(totalScore) {
    if (totalScore <= 35) {
      return 'extravert';
    } else if (totalScore >= 66) {
      return 'introvert';
    } else {
      return 'ambivert';
    }
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
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 40),
                            child: Text(constants.questions[_questionIndex]
                                ['question'] as String)),
                        ...(constants.questions[_questionIndex]['answers']
                                as List<Map<String, Object>>)
                            .map((item) => ElevatedButton(
                                  onPressed: () =>
                                      handleAnswer(item['score'] as int),
                                  child: Text(item['text'] as String),
                                ))
                            .toList(),
                      ])
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(_totalScore.toString()),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 40),
                        child: Text(constants
                            .psychoTypes[determineType(_totalScore)] as String),
                      ),
                      TextButton(
                        onPressed: handleNewQuiz,
                        child: const Text('Go through again'),
                      ),
                    ],
                  )));
  }
}
