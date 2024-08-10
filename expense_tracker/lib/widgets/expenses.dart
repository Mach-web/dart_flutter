import 'package:expense_tracker/widgets/expenses_list.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:expense_tracker/widgets/charts/chart.dart';

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

  void addExpensetoList(Expense expense){
    setState(() {
      _registeredExpenses.add(expense);
    });
  }
  void removeExpenseFromList(Expense expense){
    final removedExpenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Expense deleted"),
        duration: const Duration(seconds: 5),
        action: SnackBarAction(label: "Undo", 
          onPressed: (){
            setState(() {
              _registeredExpenses.insert(removedExpenseIndex, expense);
            });
          }),)
    );
  }
  void _openAddExpenseOverlay(){
    showModalBottomSheet(context: context, 
      isScrollControlled: true,
      builder: (context) => NewExpense(addExpense: addExpensetoList),
      constraints: const BoxConstraints(maxWidth: double.infinity),);
  }
  
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    print(width);
    print(height);
    Widget mainPage = Center(
      child: Text("No expenses found. Use the + icon to add.", 
      style: Theme.of(context).textTheme.titleLarge,),
    );
    if(_registeredExpenses.isNotEmpty){
      mainPage = ExpensesList(expensesList: _registeredExpenses, 
          onRemoveExpense: removeExpenseFromList,);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("FlutterExpenseTracker", style: Theme.of(context).textTheme.titleLarge,),
        actions: [
          IconButton(onPressed: _openAddExpenseOverlay, 
          icon: const Icon(Icons.add),
          iconSize: 12,)
        ],
      ),
      body: width < 600
      ? Column(
        children: [
          Chart(expenses: _registeredExpenses),
          Expanded(child: mainPage),
        ],
      )
      : Row(children: [
        // This constraints the width of the children
          Expanded(child: Chart(expenses: _registeredExpenses,),),
          Expanded(child: mainPage)
      ],)
    );
  }
}