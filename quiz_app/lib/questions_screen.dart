import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';

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
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Question", 
          style: TextStyle(
            fontSize: 40,
            color: Colors.white,
          ),
          ),

          const SizedBox(height: 40,
          ),
          AnswerButton(text: "Answer 1", onTap: (){}
          ),
          const SizedBox(height: 20,
          ),
          AnswerButton(text: "Answer 2", onTap: (){}
          ),
          const SizedBox(height: 20,
          ),
          AnswerButton(text: "Answer 3", onTap: (){}
          ),
          const SizedBox(height: 20,
          ),
          AnswerButton(text: "Answer 4", onTap: (){}
          ),  
        ],
      ),
    );

  }
}