import 'package:flutter/material.dart';
import 'package:quizz_app/questions_screen.dart';
import 'package:quizz_app/start_screen.dart';

class Quiz extends StatefulWidget{
  const Quiz({super.key});

  @override
  State<Quiz> createState(){
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {

  Widget? activeScreen; // You can store widges in a variable, ? because it can be null

// We need to initilise the state of the StartScreen before the rest is execurted
  @override
  void initState() {
    activeScreen =  StartScreen(switchScreen);
    super.initState();
  }

  void switchScreen(){
    setState(() {
      activeScreen = const QuestionsScreen();
    });
  }
  
  @override
  Widget build(context){
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
          gradient: LinearGradient(colors:
          [Color.fromARGB(255, 4, 95, 180),
          Color.fromARGB(255, 89, 125, 160)],
           begin: Alignment.topLeft,
           end: Alignment.bottomRight
            )
          ),child: activeScreen
        ),
      ),
    );
  }
}
