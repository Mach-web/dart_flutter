import "package:flutter/material.dart";

class StartScreen extends StatelessWidget{
  const StartScreen({super.key});

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
          const SizedBox(height: 50),
          const Text("Learn flutter the fun way",
          style: TextStyle(
            fontSize: 40,
            color: Colors.white
          ),
          ),
          const SizedBox(height: 50,),
          OutlinedButton.icon(onPressed: (){},
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 38),
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