import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget{
  const QuestionsSummary(this.fontSize, {super.key, required this.summaryData});
  final List<Map<String, Object>> summaryData;
  final fontSize;

  @override
  Widget build(context){
    return Container(
      margin: const EdgeInsets.all(40),
      child: SizedBox(
        height:500,
        // Create a scroll
        child: SingleChildScrollView(
          child: Column(
            children: summaryData.map((data){
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8
                ),
                child: Row(
                  // Style the number icon
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: data['correct_answer'] == data['user_answer']
                        ? Colors.lightBlue
                        : Colors.deepPurpleAccent,
                        borderRadius: BorderRadius.circular(100)
                      ),
                      child: Text(((data['question_index'] as int) + 1).toString(),
                      style: const TextStyle(fontSize: 30,
                      fontWeight: FontWeight.bold),
                      ),
                    ),


                  // Style the question and answers
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text(data['question'] as String, 
                    style: GoogleFonts.lato(fontSize: 38, color: Colors.white,
                    ),
                    ),
                    Text(data['user_answer']as String,
                    style: GoogleFonts.lato(fontSize: 35, color: const Color.fromARGB(255, 63, 3, 73),
                    ),
                    textAlign: TextAlign.left,),
                    Text(data['correct_answer'] as String, style: fontSize,)
                  ],),
                  const SizedBox(height: 20,),
                ],),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}