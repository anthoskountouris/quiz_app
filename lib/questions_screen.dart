import 'package:flutter/material.dart';
import 'package:quizz_app/answer_button.dart';
import 'package:quizz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget{
  const QuestionsScreen({super.key, required this.onSelectAnswer}); // We are adding the function as a parameter

  final void Function(String answer) onSelectAnswer; // We name it like this to show that this function will ger trigged on a certain event

  @override
  State<QuestionsScreen> createState(){
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen>{
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer){
    // currentQuestionIndex = currentQuestionIndex + 1;
    // currentQuestionIndex += 1;

    // Provided by flutter, gives access to the Widget class and its properties
    widget.onSelectAnswer(selectedAnswer);

    setState(() {
      currentQuestionIndex++;
    });
  }



  @override
  Widget build(context){
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity, //taking as much width is available
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // controls the verical axis
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(currentQuestion.text, 
                style: GoogleFonts.lato(color: Colors.white, fontSize:20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,),
            const SizedBox(height: 40),
            ...currentQuestion.shuffledAnswers.map((answer) {
              return AnswerButton(
                answerText: answer, 
                onTap:(){
                  answerQuestion(answer); // it will be called when the button is clicked, not automatically
                });
            })         
          ],
        ),
      ),
    );
  }
}