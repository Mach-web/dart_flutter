import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/models/question_summary.dart';

class ResultsScreen extends StatelessWidget{
  const ResultsScreen({super.key, required this.chosenAnswers});
  
  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData(){
    final List<Map<String, Object>> summary = [];

    for(var i = 0;i<chosenAnswers.length;i++){
      summary.add({
        'question_index':i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i]
      });
    }
    return summary;
  }


  @override
  Widget build(context){
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("You passed X of Y questions"),
            const SizedBox(height: 30,
            ),
            QuestionsSummary(
              summaryData: getSummaryData(),
              ),
            const SizedBox(height: 30,
            ),
            TextButton(onPressed: (){}, 
            child: const Text(
              "Retake Quiz"
            ),
            ),
          ],
        ),
      ),
    );
  }
}