enum Category {food, travel, leisure, work}

class Expense{
  Expense({required this.title, 
  required this.amount, 
  required this.date,
  required this.category
  }) : id = 12;

  final int id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
} 