import 'package:flutter/material.dart';
import 'package:quiz_app/gradient_container.dart';

void main(){
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer(
          Color.fromARGB(255, 218, 164, 83),
          Color.fromARGB(255, 219, 180, 121),
        ),
      ),
    ),
  );
}