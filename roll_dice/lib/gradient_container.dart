import 'package:flutter/material.dart';
import 'package:roll_dice/style_text.dart';
import 'package:roll_dice/roll_dice.dart';

// Alignment? startAlignment;
// var startAlignment = Alignment.topRight;
// final startAlignment = Alignment.topRight;
const startAlignment = Alignment.topRight;
const endAlignment = Alignment.bottomLeft;

class GradientContainer extends StatelessWidget{
  // const GradientContainer({key}) : super(key: key);
  const GradientContainer({super.key, required this.colours});
  final List<Color> colours;
  
  @override
  Widget build(context){
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colours,
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: const Center(
        child: DiceRoller()
            ),
        );
        // child: StyleText("Welcome to flutter"),
    }
}