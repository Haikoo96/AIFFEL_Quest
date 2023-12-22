import 'package:flutter/material.dart';
import 'gamebegin.dart';
import 'imgselection.dart';
import 'result_a.dart'; 
import 'result_b.dart';  

void main() {
  runApp(const AnswerSelectApp());
}

class AnswerSelectApp extends StatelessWidget {
  const AnswerSelectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/one',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/one':
            return MaterialPageRoute(builder: (context) => GameBegins());
          case '/two':
            return MaterialPageRoute(builder: (context) => const AnswerSelect());
          case '/resultwon':
            final args = settings.arguments;
            return MaterialPageRoute(builder: (context) => YouWonPage(num_attempts: args is int ? args : 0));
          case '/resultlost':
            final args = settings.arguments;
            return MaterialPageRoute(builder: (context) => YouLostPage(num_attempts: args is int ? args : 0));
          default:
            return MaterialPageRoute(builder: (context) => GameBegins());
        }
      },
    );
  }
}
