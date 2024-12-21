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
        const SizedBox(height: 13
        ),
        const Text(
          "Learn Flutter the fun way!",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white
          ),
        ),
        const SizedBox(height: 10,
        ),
        TextButton(
          onPressed: (){}, 
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            padding: const EdgeInsets.all(8
            ),
            side: const BorderSide(
              color: Colors.orange,
              width: 10,
            ),
            textStyle: const TextStyle(
              fontSize: 20
            )
          ),
          child: const Text("Start quiz"
          ),
        ),
      ],
    );
  }
}