import 'package:expense_tracker/widgets/expenses_list.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';

class Expenses extends StatefulWidget{
  const Expenses({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses>{
  final List<Expense> _registeredExpenses= [
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
  void _openAddExpenseOverlay(){
    showModalBottomSheet(context: context, builder: (ctx) => const NewExpense());
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FlutterExpenseTracker", style: TextStyle(fontSize: 45),),
        actions: [
          IconButton(onPressed: _openAddExpenseOverlay, 
          icon: const Icon(Icons.add),
          iconSize: 45,)
        ],
      ),
      body: Column(
        children: [
          const Text("The chart"),
          Expanded(
            child: ExpensesList(expensesList: _registeredExpenses)
            ),
        ],
      ),
    );
  }
}