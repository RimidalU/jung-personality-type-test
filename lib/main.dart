import 'package:flutter/material.dart';
import 'package:jung_personality_type_test/result.dart';
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
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 40),
                            child: Text(
                                style: const TextStyle(fontSize: 15),
                                constants.questions[_questionIndex]['question']
                                    as String)),
                        Wrap(
                            spacing: 20,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            direction: Axis.vertical,
                            children: [
                              ...(constants.questions[_questionIndex]['answers']
                                      as List<Map<String, Object>>)
                                  .map((item) => ElevatedButton(
                                        onPressed: () =>
                                            handleAnswer(item['score'] as int),
                                        child: Text(item['text'] as String),
                                      ))
                                  .toList(),
                            ])
                      ])
                : Result(
                    handleNewQuiz: handleNewQuiz,
                    totalScore: _totalScore,
                  )));
  }
}
