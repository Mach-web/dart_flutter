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
  var currentScreen = "home";

  void switchScreen(){
    setState(() {
      currentScreen = 'quiz';
    });
  }
  /*
  Widget? currentScreen;

  @override
  void initState() {
    currentScreen = StartScreen(switchScreen);
    super.initState();
  }
  void switchScreen(){
    setState(() {
      currentScreen = const QuestionsScreen();
    });
  }
  */

  @override
  Widget build(context){
    /*Widget activeWidget = currentScreen == "home"
    ? StartScreen(switchScreen)
    : const QuestionsScreen();*/
    Widget activeWidget = StartScreen(switchScreen);
    if(currentScreen == "quiz"){
      activeWidget = const QuestionsScreen();
    }
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
          /* 
          child: currentScreen,
          child: currentScreen == 'home'
          ? StartScreen(switchScreen)
          : const QuestionsScreen(),
          */
          child: activeWidget,
        ),
        // body: GradientContainer(
        //   Color.fromARGB(255, 76, 6, 88),
        //   Color.fromARGB(255, 71, 6, 83),
        // ),
      ),
    );
  }
}