import 'package:flutter/material.dart';
import 'package:quizz_app/questions_screen.dart';

class StartScreen extends StatelessWidget{

  const StartScreen({super.key});

  @override
  Widget build(context){
    return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(178, 255, 255, 255),
            ),
            const SizedBox(
                height:60,
               ),
            const Text('Learn Flutter the fun way!',style: TextStyle(color: Colors.white, fontSize: 20)),
            const SizedBox(
                height:60,
               ),
            OutlinedButton.icon(
                  onPressed: ,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: const BorderSide(color: Colors.white)
                  ),
                  icon: const Icon(Icons.arrow_right_rounded, size: 25, ),
                  label: const Text("Start Quiz")
                ),
          ],
        ),
      );
  }
}