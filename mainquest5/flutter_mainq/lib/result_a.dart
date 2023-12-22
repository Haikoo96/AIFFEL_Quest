import 'package:flutter/material.dart';

class YouWonPage extends StatelessWidget {
  final int num_attempts;

  const YouWonPage({Key? key, required this.num_attempts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('승리를 축하합니다.',
            style: TextStyle(fontSize: 24)),
            const SizedBox(
              height: 20,
            ),
            Text('도전횟수: $num_attempts',
            style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}

