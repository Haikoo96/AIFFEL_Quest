import 'package:flutter/material.dart';

class AnswerSelect extends StatefulWidget {
  const AnswerSelect({super.key});

  @override
  _AnswerSelectState createState() => _AnswerSelectState();
}

class _AnswerSelectState extends State<AnswerSelect> {
  String? selectPlatform;
  int num_attempts = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('아래 Twitch emote을 맞춰보세요',
            style: TextStyle(
              fontSize: 20,
            )),
            const SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.center,
              child: Image.asset('images/kekw-emote-2.jpg'),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio<String>(
                  value: 'kekw',
                  groupValue: selectPlatform,
                  onChanged: (String? value) {
                    setState(() {
                      selectPlatform = value;
                    });
                  },
                ),
                const Text('KEKW'),
                // You can add more Radio buttons here with different values
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  value: 'monkas',
                  groupValue: selectPlatform,
                  onChanged: (String? value) {
                    setState(() {
                      selectPlatform = value;
                    });
                  }
                ),
                const Text('MonkaS'),
              ] 
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  num_attempts++;
                });
                switch (selectPlatform) {
                  case 'kekw':
                    Navigator.pushNamed(context, '/resultwon', arguments: num_attempts);
                    break;
                  case 'monkas':
                    Navigator.pushNamed(context, '/resultlost', arguments: num_attempts);
                    break;
                  default:
                    break;
                }
              },
              child: const Text('결과확인')
            )
          ],
        ),
      ),
    );
  }
}
