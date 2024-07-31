import 'package:flutter/foundation.dart';
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
    final currentQuestion = questions[0];
    const double sizedBoxHeight = 20;
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(currentQuestion.text, 
          style: const TextStyle(
            fontSize: 40,
            color: Colors.white,
          ),
          ),

          const SizedBox(height: sizedBoxHeight,
          ),

          ...currentQuestion.answers.map((answers){
            return 
              AnswerButton(text: answers,
              onTap: (){},
              );
            }),
    
            // List<Widget> sizedAnswerbutton = [const SizedBox(height: 20,), 
            // AnswerButton(text: answers, onTap: (){})];
            // return Column(
            //   // crossAxisAlignment: CrossAxisAlignment.stretch,
            //   children: [
            //     const SizedBox(height: sizedBoxHeight,
            //     ),
            //     AnswerButton(text: answers, onTap: (){}
            //     ),
            //   ]
            // );
  
        ],
      ),
    );

  }
}