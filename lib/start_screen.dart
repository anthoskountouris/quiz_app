import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget{

  const StartScreen (this.startQuiz, {super.key});

  final void Function() startQuiz;

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
            Text('Learn Flutter the fun way!', style: GoogleFonts.lato(color: Colors.white, fontSize: 20)),
            const SizedBox(
                height:60,
               ),
            OutlinedButton.icon(
                  onPressed: startQuiz,
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