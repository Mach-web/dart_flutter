import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/widgets/category_grid_item.dart';
import 'package:meals/screens/meal.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';

class CategoriesScreen extends StatelessWidget{
  const CategoriesScreen({super.key, required this.toggleFavourite});

  final Function(Meal meal) toggleFavourite;

  void displayMealsScreen(BuildContext context, Category category){
    final categoryMeals = dummyMeals
      .where((meal)=>meal.categories
      .contains(category.id),)
      .toList();
    Navigator.push(context, MaterialPageRoute(
      builder: (ctx) => MealsScreen(title: category.title, meals: categoryMeals, toggleFavourite: toggleFavourite,),),
      );
  }

   @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          crossAxisSpacing: 15,
          mainAxisSpacing: 20),
        children: availableCategories.map(
          (category) => CategoryGridItem(category: category, onSelectCategory: ()=>displayMealsScreen(context, category),)
          ).toList()
          );
  }
}