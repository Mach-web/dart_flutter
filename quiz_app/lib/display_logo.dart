import 'package:flutter/material.dart';

class DisplayLogo extends StatelessWidget{
  const DisplayLogo({super.key});

  @override
  Widget build(context){
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/quiz-logo.png'
        ),
        const SizedBox(height: 40
        ),
        const Text(
          "Learn Flutter the fun way!",
          style: TextStyle(
            fontSize: 42,
            color: Colors.white
          ),
        ),
        const SizedBox(height: 30,
        ),
        TextButton(
          onPressed: (){}, 
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            padding: const EdgeInsets.all(30
            ),
            side: const BorderSide(
              color: Colors.orange,
              width: 10,
            ),
            textStyle: const TextStyle(
              fontSize: 50
            )
          ),
          child: const Text("Start quiz"
          ),
        ),
      ],
    );
  }
}