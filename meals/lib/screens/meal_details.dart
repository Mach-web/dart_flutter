import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meals/main.dart';
import 'package:meals/models/meal.dart';

class MealDetails extends StatelessWidget{
 const MealDetails({super.key, required this.meal});

  final Meal meal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          meal.title
        ),
      ),
      body: Text(meal.ingredients[1]),
    );
  }
}