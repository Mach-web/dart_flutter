import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget{
  const QuestionsSummary({super.key, required this.summaryData});
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context){
    return Container(
      margin: const EdgeInsets.all(40),
      child: SizedBox(
        height:750,
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
                    const SizedBox(width: 30,),


                  // Style the question and answers
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text(data['question'] as String, 
                      style: GoogleFonts.lato(fontSize: 38, 
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                      ),
                      ),
                      Text(data['user_answer']as String,
                      style: GoogleFonts.lato(fontSize: 35, color:const Color.fromARGB(255, 230, 230, 4),
                      ),
                      ),
                      // textAlign: TextAlign.left,),
                      Text(data['correct_answer'] as String, 
                      style: GoogleFonts.amita(fontSize: 35, color: const Color.fromARGB(255, 154, 205, 228)),)
                    ],),
                  ),
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