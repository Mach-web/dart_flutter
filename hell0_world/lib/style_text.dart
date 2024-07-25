import 'package:flutter/material.dart';

class StyleText extends StatelessWidget{
  // const StyleText(this.text, {super.key});
  const StyleText(String outputText, {super.key}): text = outputText;
  final String text;

  @override
  Widget build(context){
    return Text(text,
    style: const TextStyle(
      color: Colors.black87,
      backgroundColor: Colors.cyan,
      fontSize: 35,
      fontWeight: FontWeight.bold,
    ),
    );
  }
}