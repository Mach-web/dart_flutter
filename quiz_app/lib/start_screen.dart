import "package:flutter/material.dart";

class StartScreen extends StatelessWidget{
  const StartScreen({super.key});

  @override
  Widget build(context){
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/quiz-logo.png'
          ),
          const SizedBox(height: 50),
          const Text("Learn flutter the fun way",
          style: TextStyle(
            fontSize: 40,
            color: Colors.white
          ),
          ),
          const SizedBox(height: 50,),
          OutlinedButton(onPressed: (){},
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 38),
          ),
          child: const Text("Start quiz"
          ),
          ),
        ],
      ),
    );
  }
}