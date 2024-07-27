import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget{
  const GradientContainer({super.key});
  @override
  Widget build(context){
    return Container(
      decoration: const BoxDecoration(
        color: Colors.deepPurpleAccent
        ),
    );
  }
}