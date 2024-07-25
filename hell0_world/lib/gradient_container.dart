import 'package:flutter/material.dart';

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
        child: Text("This is my first flutter app",
        style: TextStyle(
          backgroundColor: Colors.cyan,
          color: Color.fromARGB(255, 18, 21, 15),
          fontSize: 32,
        ),
        ),
      ),
    );
  }
}