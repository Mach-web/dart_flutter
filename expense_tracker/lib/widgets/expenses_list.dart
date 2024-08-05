import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expense_item.dart';

class ExpensesList extends StatelessWidget{
  const ExpensesList({super.key, required this.expensesList});
  final List<Expense> expensesList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expensesList.length, 
      itemBuilder: (ctx, index) => ExpenseItem(expense: expensesList[index])
    );
  }
}