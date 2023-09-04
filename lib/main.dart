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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Опросник Юнга.'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(constants.questions[_questionIndex]['question'] as String),
            ...(constants.questions[_questionIndex]['answers']
                    as List<Map<String, Object>>)
                .map((item) => ElevatedButton(
                      onPressed: () {},
                      child: Text(item['text'] as String),
                    ))
                .toList(),
            // Text(constants.psychoTypes['extravert'] as String),
          ],
        )));
  }
}
