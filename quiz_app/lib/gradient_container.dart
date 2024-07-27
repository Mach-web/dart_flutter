import 'package:flutter/material.dart';
import 'package:quiz_app/display_logo.dart';

class GradientContainer extends StatelessWidget{
  const GradientContainer(this.color1, this.color2, {super.key});
  final Color color1, color2;

  @override
  Widget build(context){
    return Container(
      decoration: BoxDecoration(
        gradient: SweepGradient(
          colors: [
            color1,
            color2
          ] 
          ),
        // color: Colors.deepPurpleAccent
        ),
        child: const Center(
          child: DisplayLogo(),
        ),
    );
  }
}