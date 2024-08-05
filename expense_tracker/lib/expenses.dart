import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class Expenses extends StatefulWidget{
  const Expenses({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses>{
  final List<Expense> _registeresExpenses= [
    Expense(
      title: "Flutter course", 
      amount: 13.99, 
      date: DateTime.now(), 
      category: Category.work
      ),
    Expense(
      title: "Juice party", 
      amount: 15.99, 
      date: DateTime.now(), 
      category: Category.leisure
      )
  ];
  
  @override
  Widget build(BuildContext context) {
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