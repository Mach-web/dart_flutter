import 'package:flutter/cupertino.dart';
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
    final summaryData = getSummaryData();
    var numTotalQuestions = questions.length;
    var numCorrectAnswers = summaryData.where((data){
      return data['correct_answer'] == data['user_answer'];
    }).length;

    const fontSize = TextStyle(fontSize: 32);
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You passed $numCorrectAnswers of $numTotalQuestions questions",
            style: fontSize,
            ),
            const SizedBox(height: 30,
            ),
            QuestionsSummary(
              fontSize,
              summaryData: summaryData,
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