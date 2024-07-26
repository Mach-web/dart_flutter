import 'package:flutter/material.dart';
import 'dart:math';

class DiceRoller extends StatefulWidget{
  const DiceRoller({super.key});
  @override
  State<DiceRoller> createState(){
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller>{
  var currentDice = 4;
  void rollDice(){
    setState((){
      currentDice = Random().nextInt(7) + 1;
    });
  }

  @override
  Widget build(context){
    return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/dice-$currentDice.png', 
              width: 400, height: 400, alignment: Alignment.center
            ),
            // TextButton(onPressed: (){}, child: const Text("Roll Dice")
            const SizedBox(height: 40),
            TextButton(
              onPressed: rollDice, 
              style: TextButton.styleFrom(
                // padding: const EdgeInsets.only(
                //   top:20
                // ),
                foregroundColor: Colors.white,
                textStyle: const TextStyle(
                  fontSize: 32
                )
              ),
              child: const Text("Roll Dice"
              ),
              ),
            ]
            );

}
}