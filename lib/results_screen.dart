import 'package:flutter/material.dart';
import 'package:quizz_app/data/questions.dart';
import 'package:quizz_app/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizz_app/quiz.dart';
import 'package:quizz_app/results_screen.dart';


class ResultsScreen extends StatelessWidget{
  const ResultsScreen({super.key, 
  required this.chosenAnswers,
  required this.onRestart});

  final List<String> chosenAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData(){
    final List<Map<String, Object>> summary = [];

      for (var i=0; i<chosenAnswers.length; i++){
        summary.add({'question_index': i,
                      'question': questions[i].text,
                      'correct_answer': questions[i].answers[0],
                      'user_answer': chosenAnswers[i]
                    });
      }

    return summary;
  }

  @override
  Widget build(BuildContext context){
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length; 
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity, //taking as much width is available
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // controls the verical axis
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!", style: GoogleFonts.lato(color: Colors.white, fontSize: 20), textAlign: TextAlign.center),
            const SizedBox(height: 30,),
            QuestionsSummary(summaryData: summaryData),
            const SizedBox(height: 30,),
            // TextButton(
            //   onPressed: (){},
            //   child: const Text("Restart Quiz!"),
            //   )
            Column(
              children: [
                OutlinedButton.icon(
                      onPressed: onRestart,
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: const BorderSide(color: Colors.white),
                      ),
                      icon: const Icon(Icons.restart_alt, size: 25, ),
                      label: const Text("Restart Quiz")
                    ),
              ],
            ),
        ],),
          ),
        );

  }
}