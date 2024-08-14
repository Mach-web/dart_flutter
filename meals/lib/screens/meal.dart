import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_item.dart';
import 'package:meals/screens/meal_details.dart';

class MealsScreen extends StatelessWidget{
  const MealsScreen({super.key, this.title, required this.meals});

  final String? title;
  final List<Meal> meals;

  void displayMealDetails(BuildContext context, Meal meal){
    Navigator.of(context).push(MaterialPageRoute(builder: 
      (ctx) => MealDetailsScreen(meal: meal),),);
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Oops....Items not found", style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Theme.of(context).colorScheme.onSurface),),
            const SizedBox(height: 16,),
            Text("Try selecting a different category", style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Theme.of(context).colorScheme.onSurface),)
          ],
        ),
      );
    
    if(meals.isNotEmpty){
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealItem(meal: meals[index], displayMealDetails: () => displayMealDetails(context, meals[index]),),
        );
    }
    if(title == null){
      return content;
    }
    else{
      return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content
    );
    }
  }
}