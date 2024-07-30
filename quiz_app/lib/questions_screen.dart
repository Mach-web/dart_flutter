import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

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
    final currentQuestion = questions[1];
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(currentQuestion.text, 
          style: const TextStyle(
            fontSize: 40,
            color: Colors.white,
          ),
          ),

          const SizedBox(height: 40,
          ),
          AnswerButton(text: currentQuestion.answers[0], onTap: (){}
          ),
          const SizedBox(height: 20,
          ),
          AnswerButton(text: currentQuestion.answers[1], onTap: (){}
          ),
          const SizedBox(height: 20,
          ),
          AnswerButton(text: currentQuestion.answers[2], onTap: (){}
          ),
          const SizedBox(height: 20,
          ),
          AnswerButton(text: currentQuestion.answers[3], onTap: (){}
          ),  
        ],
      ),
    );

  }
}