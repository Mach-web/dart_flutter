import 'package:flutter/material.dart';

class Expenses extends StatefulWidget{
  const Expenses({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses>{
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const Scaffold(
      body: Column(
        children: [
          Text("The chart"),
          Text("Expenses list.....")
        ],
      ),
    );
  }
}