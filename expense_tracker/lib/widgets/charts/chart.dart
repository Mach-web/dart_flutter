import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/charts/chart_bar.dart';
import 'package:expense_tracker/models/expense.dart';

class Chart extends StatelessWidget{
  const Chart({super.key, required this.expenses});

  final List<Expense> expenses;
  List<ExpenseBucket> get expensebuckets{
    return[
      ExpenseBucket.forCategory(expenses, Category.food),
      ExpenseBucket.forCategory(expenses, Category.leisure),
      ExpenseBucket.forCategory(expenses, Category.travel),
      ExpenseBucket.forCategory(expenses, Category.work),
    ];
  }

  double get maxTotalExpense{
    double maxTotalExpense = 0;
    for (final buckets in expensebuckets){
      if(buckets.totalExpenses > maxTotalExpense){
        maxTotalExpense = buckets.totalExpenses;
      }
    }
    return maxTotalExpense;
  }
  
  @override
  Widget build(BuildContext context) {
    final isDarkMode =
      MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 8
      ),
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(colors: [
          Theme.of(context).colorScheme.primary.withOpacity(0.3),
          Theme.of(context).colorScheme.primary.withOpacity(0.0),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter
        )
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for(final bucket in expensebuckets)
                ChartBar(fill: bucket.totalExpenses / maxTotalExpense)
              ],
            ),
          ),
          const SizedBox(height: 16,),
          Row(
            children: expensebuckets.map((bucket) => 
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Icon( 
                    categoryIcons[bucket.category],
                    size: 45,
                    color: isDarkMode
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.primary.withOpacity(0.65),
                    ),
                  ),
                ),
              ).toList()
            ),
        ],
      ),
    );
  }

}