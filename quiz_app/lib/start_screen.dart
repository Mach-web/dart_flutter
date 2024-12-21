import "package:flutter/material.dart";

class StartScreen extends StatelessWidget{
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;
  @override
  Widget build(context){
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            color: const Color.fromARGB(115, 255, 255, 255),
          ),
          //   ),
          // Opacity(
          //   opacity: 0.25,
          //   child: Image.asset('assets/images/quiz-logo.png'
          //   ),
          // ),
          const SizedBox(height: 10),
          const Text("Get started",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
          ),
          const SizedBox(height: 10,),
          OutlinedButton.icon(onPressed: 
            startQuiz,
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 14),
          ),
          icon: const Icon(Icons.arrow_right_alt_outlined,
          size: 60,
          ),
          label: const Text("Start quiz"
          ),
          ),
        ],
      ),
    );
  }
}