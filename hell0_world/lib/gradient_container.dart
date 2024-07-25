import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget{
  // const GradientContainer({key}) : super(key: key);
  const GradientContainer({super.key});
  @override
  Widget build(context){
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 156, 125, 209),
            Color.fromARGB(255, 48, 7, 120),
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
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