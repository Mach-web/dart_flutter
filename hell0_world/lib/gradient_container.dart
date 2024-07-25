import 'package:flutter/material.dart';
import 'package:hell0_world/style_text.dart';

// Alignment? startAlignment;
// var startAlignment = Alignment.topRight;
// final startAlignment = Alignment.topRight;
const startAlignment = Alignment.topRight;
const endAlignment = Alignment.bottomLeft;

class GradientContainer extends StatelessWidget{
  // const GradientContainer({key}) : super(key: key);
  const GradientContainer({super.key});
  @override
  Widget build(context){
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: const [
            Color.fromARGB(255, 156, 125, 209),
            Color.fromARGB(255, 86, 12, 215),
          ],
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: const Center(
        child: StyleText("           Hello!..            \n Welcome to flutter"),
        ),
        );
    }
}