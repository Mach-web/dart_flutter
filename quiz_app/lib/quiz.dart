import 'package:flutter/material.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/questions_screen.dart';

class Quiz extends StatefulWidget{
  const Quiz({super.key});

  @override
  State<Quiz> createState(){
    return _QuizState();
  }
}

class _QuizState extends State<Quiz>{
  Widget currentScreen = const StartScreen();
    
  void switchScreen(){
    setState(() {
      currentScreen = const QuestionsScreen();
    });
  }

  @override
  Widget build(context){
    return  MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 92, 5, 108),
                Colors.purpleAccent,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft
            ),
          ),
          child: currentScreen,
        ),
        // body: GradientContainer(
        //   Color.fromARGB(255, 76, 6, 88),
        //   Color.fromARGB(255, 71, 6, 83),
        // ),
      ),
    );
  }
}