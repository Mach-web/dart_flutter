import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expense_item.dart';

class ExpensesList extends StatelessWidget{
  const ExpensesList({super.key, required this.expensesList, required this.onRemoveExpense});
  final List<Expense> expensesList;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expensesList.length, 
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(expensesList[index]), 
        background: Container(color: Theme.of(context).colorScheme.error.withOpacity(0.75),
        margin: Theme.of(context).cardTheme.margin),
        onDismissed: (direction){
          onRemoveExpense(expensesList[index]);
        },
        child: ExpenseItem(expense: expensesList[index]),),
    );
  }
}