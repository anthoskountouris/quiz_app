import 'package:flutter/material.dart';
import 'package:quizz_app/data/questions.dart';
import 'package:quizz_app/questions_screen.dart';
import 'package:quizz_app/start_screen.dart';
// import 'package:quizz_app/data/questions.dart';
import 'package:quizz_app/results_screen.dart';

class Quiz extends StatefulWidget{
  const Quiz({super.key});

  @override
  State<Quiz> createState(){
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  
  List<String> selectedAnswers = []; // This list contains our pre-defined answers for each question (1-1.2-2,...)

  var activeScreen = 'start-screen';


  // Widget? activeScreen; // You can store widges in a variable, ? because it can be null

// We need to initilise the state of the StartScreen before the rest is executed
  // @override
  // void initState() {
  //   activeScreen =  StartScreen(switchScreen);
  //   super.initState();
  // }

// This function is called after we press the button. This is because the switchScreen is passed in the StartScreen
// constructor. The setScreen(() {})  executes again the build() function.
  void switchScreen(){
    setState(() {
      // activeScreen = const QuestionsScreen();
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer){
    selectedAnswers.add(answer);

    if(selectedAnswers.length == questions.length){
      setState(() {
        // selectedAnswers = [];        
        activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz(){
    setState(() {
      selectedAnswers = [];        
      activeScreen = 'start-screen';
    });
  }


  
  @override
  Widget build(context){
    // final screenWidget = activeScreen == 'start-screen' 
    //       ? StartScreen(switchScreen) 
    //       : const QuestionsScreen();
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen'){
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer); //Since we added the function in the constructor, we pass it here
    }

    if (activeScreen == 'results-screen'){
      screenWidget = ResultsScreen(chosenAnswers: selectedAnswers, onRestart: restartQuiz);
    }


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
          ),child: screenWidget
        ),
      ),
    );
  }
}
