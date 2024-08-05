import 'package:flutter/material.dart';
// import 'package:uuid/uuid.dart';
// import 'package:intl/intl.dart';

enum Category {food, travel, leisure, work}
const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.work,
  Category.work: Icons.work,
};
class Expense{
  Expense({required this.title, 
  required this.amount, 
  required this.date,
  required this.category
  }) : id = 1;

  final int id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  DateTime get formattedDate{
    return date;
  }
} 