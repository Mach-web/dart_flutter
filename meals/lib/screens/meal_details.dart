import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/favorite_provider.dart';

class MealDetailsScreen extends ConsumerWidget{
const MealDetailsScreen({super.key, required this.meal, 
//  required this.toggleFavourite
 });

  final Meal meal;
  // final Function(Meal meal) toggleFavourite;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Meal> favorites = ref.watch(favoriteMealsProvider);
    final bool isFavorite = favorites.contains(meal);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          meal.title
        ),
        actions: [
          IconButton(onPressed: (){
            // toggleFavourite(meal);
            bool isAdded = ref.read(
              favoriteMealsProvider.notifier)
              .toggleFavoriteStatus(meal);

            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
            content: Text(isAdded 
              ? "Meal added to favorites"
              : "Meal removed from favorites", 
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.bold
              ),
            ),
          ),
        );}, 
        icon: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (child, animation) => 
            RotationTransition(
              turns: Tween<double>(begin: 0.8, end: 1).animate(animation), 
              child: child,),
          child: Icon(isFavorite
          ? Icons.star
          : Icons.star_border,
          key: ValueKey(isFavorite),),),
          color: Colors.orangeAccent,),
        ],
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
                "${index+1}. ${meal.steps[index]}",
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