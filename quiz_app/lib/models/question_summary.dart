import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget{
  const QuestionsSummary(this.fontSize, {super.key, required this.summaryData});
  final List<Map<String, Object>> summaryData;
  final fontSize;

  @override
  Widget build(context){
    return Container(
      margin: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: summaryData.map((data){
          return Row(children: [
            Text(((data['question_index'] as int) + 1).toString(),
            style: fontSize,),
            Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text(data['question'] as String, style: fontSize,),
              Text(data['user_answer']as String, style: fontSize,),
              Text(data['correct_answer'] as String, style: fontSize,)
            ],),
            const SizedBox(height: 20,),
          ],);
        }).toList(),
      ),
    );
  }
}