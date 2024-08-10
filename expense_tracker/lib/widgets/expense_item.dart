import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class ExpenseItem extends StatelessWidget{
  const ExpenseItem({super.key, required this.expense});

  final Expense expense;
  @override
  Widget build(BuildContext context) {
    return Card(
      child:Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(expense.title, style: Theme.of(context).textTheme.titleLarge,),
            Row(children: [
              Text('\$${expense.amount.toStringAsFixed(2)}', style: Theme.of(context).textTheme.titleLarge,),
              const Spacer(),
              Row(children: [
                Icon(categoryIcons[expense.category], size: 13,),
                const SizedBox(width: 10,),
                Text(expense.formattedDate, style: Theme.of(context).textTheme.titleLarge,),
              ],)
            ],)
          ],
        ),
      )
    );
  }
}