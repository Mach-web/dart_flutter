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
      ],
    );
  }
}