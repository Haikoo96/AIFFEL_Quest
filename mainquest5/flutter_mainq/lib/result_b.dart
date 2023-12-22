import 'package:flutter/material.dart';

class YouLostPage extends StatelessWidget {
  final int num_attempts;

  const YouLostPage({Key? key, required this.num_attempts}) : super(key: key);

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
            const Text('아쉬운 패배ㅠ.',
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