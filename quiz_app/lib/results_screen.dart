import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget{
  const ResultsScreen({super.key, required this.chosenAnswers});
  
  final List<String> chosenAnswers;
  @override
  Widget build(context){
    print(chosenAnswers);
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
            const Text("This are the ansers"
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