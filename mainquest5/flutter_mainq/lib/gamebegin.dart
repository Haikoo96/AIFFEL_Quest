// ignore_for_file: use_key_in_widget_constructors, avoid_print, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';

class GameBegins extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: (){
              print('The game has begun!');
              Navigator.pushNamed(context, '/two');
            },
            child: Text(
              '게임시작',
              style: TextStyle(
                fontSize: 25,
              )),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple[400],
              foregroundColor: Colors.white,
              minimumSize: Size(150, 100),  
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          )
        )
      )
    );
  }
}