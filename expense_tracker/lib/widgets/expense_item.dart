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
          horizontal: 80,
          vertical: 64
        ),
        child: Column(
          children: [
            Text(expense.title, style: const TextStyle(fontSize: 40),),
            Row(children: [
              Text('\$${expense.amount.toStringAsFixed(2)}', style: const TextStyle(fontSize: 40),),
              const Spacer(),
              Row(children: [
                Icon(categoryIcons[expense.category], size: 50,),
                const SizedBox(width: 40,),
                Text(expense.formattedDate, style: const TextStyle(fontSize: 40),),
              ],)
            ],)
          ],
        ),
      )
    );
  }
}