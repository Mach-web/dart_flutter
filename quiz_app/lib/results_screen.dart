import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/models/question_summary.dart';

class ResultsScreen extends StatelessWidget{
  const ResultsScreen({super.key, required this.chosenAnswers, required this.onRestart});
  
  final List<String> chosenAnswers;
  final void Function() onRestart;

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

  
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("You passed $numCorrectAnswers of $numTotalQuestions questions",
              style: GoogleFonts.lato(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 219, 200, 154),
              ),
              ),
              const SizedBox(height: 30,
              ),
              QuestionsSummary(
                summaryData: summaryData,
                ),
              const SizedBox(height: 30,
              ),
              TextButton.icon(onPressed: onRestart,
              style: TextButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 219, 200, 154),
              ),
              icon: const Icon(Icons.restart_alt, 
              size: 38,
              ),
               label: const Text("Retake Quiz",
               style: TextStyle(fontSize: 16),
               ),
               ),
            ],
          ),
        ),
      ),
    );
  }
}