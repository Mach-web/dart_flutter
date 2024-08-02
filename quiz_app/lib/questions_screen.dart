import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget{
  const QuestionsScreen(this.onSelectAnswer, {super.key});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState(){
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen>{

  var currentQuestionIndex = 0;
  void nextQuestion(String selectedAnswer){
    setState(() {
      widget.onSelectAnswer(selectedAnswer);
      currentQuestionIndex++;
    });
  }
  
  @override
  Widget build(context){
    final currentQuestion = questions[currentQuestionIndex];
    const double sizedBoxHeight = 20;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(currentQuestion.text, 
            style: GoogleFonts.kalnia(
              fontSize: 45,
              fontWeight: FontWeight.bold,
              // color: Colors.white,
            ),
            textAlign: TextAlign.center,
            ),
        
            const SizedBox(height: sizedBoxHeight,
            ),
        
            // ...currentQuestion.shuffleAnswers().map((answers){
            //   return 
            //     AnswerButton(text: answers,
            //     onTap: nextQuestion,
            //     );
            //   }),
            
              // List<Widget> sizedAnswerbutton = [const SizedBox(height: 20,), 
              // AnswerButton(text: answers, onTap: (){})];
              ...currentQuestion.shuffleAnswers().map((answers){
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: sizedBoxHeight,
                  ),
                  AnswerButton(text: answers, onTap: (){
                    nextQuestion(answers);
                  }
                  ),
                ]
              );
            })
          ],
        ),
      ),
    );
  }
}