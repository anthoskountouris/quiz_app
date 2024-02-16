import 'package:flutter/material.dart';
import 'package:quizz_app/start_screen.dart';
void main(){
  runApp(
     MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
          gradient: LinearGradient(colors:
          [Color.fromARGB(255, 4, 95, 180),
          Color.fromARGB(255, 89, 125, 160)],
           begin: Alignment.topLeft,
           end: Alignment.bottomRight
          )
        ),child: const StartScreen()),
      ),
    ),
  );
}