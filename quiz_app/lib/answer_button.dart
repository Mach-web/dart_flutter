import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget{
  const AnswerButton({super.key, required this.text, required this.onTap});

  final String text;
  final void Function() onTap;

  @override
  Widget build(context){
    return ElevatedButton(
      onPressed: onTap, 
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 35
        ),
        padding: const EdgeInsets.symmetric(horizontal: 40,
        vertical: 20,
        ),
        backgroundColor: const Color.fromARGB(255, 4, 25, 87
        ),
        foregroundColor: Colors.white,
        // minimumSize: const Size(300, 60
        // ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40
          ),
          ),
      ),
      child: Text(text,
      textAlign: TextAlign.center,
      ),
      );
  }
}