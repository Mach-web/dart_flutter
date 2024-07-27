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
        const Text(
          "Learn Flutter the fun way!",
          style: TextStyle(
            fontSize: 35,
            color: Colors.white
          ),
        ),
      ],
    );
  }
}