import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class MealDetailsScreen extends StatelessWidget{
 const MealDetailsScreen({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          meal.title
        ),
      ),
      body: ListView(
          children: [
            Image.network(
              meal.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 14),
            Text(
              "Ingredients",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold
              ),),
            const SizedBox(height: 10,),
            for(final ingredient in meal.ingredients)
            Text(
              ingredient,
              textAlign: TextAlign.center,
              style:  Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 14),
            Text(
              "Steps",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold
              ),),
            const SizedBox(height: 10,),
            for(var index = 0; index < meal.steps.length; index++)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 8),
              child: Text(
                "${index+1}. ${meal.steps[index]}.",
                textAlign: TextAlign.left,
                style:  Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
          ],
        ),
    );
  }
}