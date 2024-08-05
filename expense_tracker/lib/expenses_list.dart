import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class ExpensesList extends StatelessWidget{
  ExpensesList({super.key, required this.expensesList});
  List<Expense> expensesList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expensesList.length, 
      itemBuilder: (ctx, index) => Text(expensesList[index].title
    ),
    );
  }
}