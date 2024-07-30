import 'package:flutter/material.dart';

class QuestionsScreen extends StatefulWidget{
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState(){
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen>{
  @override
  Widget build(context){
    return Column(
      children: [
        const Text("Question"
        ),
        const SizedBox(height: 40,
        ),
        ElevatedButton(
          onPressed: (){}, 
          child: const Text("Question 1"
          ),
          ),
        ElevatedButton(
          onPressed: (){}, 
          child: const Text("Question 1"
          ),
          ),
        ElevatedButton(
          onPressed: (){}, 
          child: const Text("Question 1"
          ),
          ),
        ElevatedButton(
          onPressed: (){}, 
          child: const Text("Question 1"
          ),
          ),
      ],
    );

  }
}