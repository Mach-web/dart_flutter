import 'package:flutter/material.dart';

class DiceRoller extends StatefulWidget{
  const DiceRoller({super.key});
  @override
  State<DiceRoller> createState(){
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller>{
  var activeDice = 'assets/images/dice-4.png';
  void rollDice(){
    setState((){
      activeDice = 'assets/images/dice-2.png';
    });
  }

  @override
  Widget build(context){
    return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              activeDice, width: 400, height: 400, alignment: Alignment.center
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