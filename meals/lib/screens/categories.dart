import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/widgets/category_grid_item.dart';
import 'package:meals/screens/meal.dart';
import 'package:meals/data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget{
  const CategoriesScreen({super.key});

  void displayMealsScreen(BuildContext context){
    Navigator.push(context, MaterialPageRoute(
      builder: (ctx) => const MealsScreen(title: "Welcome to meals", meals: []),),
      );
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("What's your taste"),
      ),
      body: GridView(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          crossAxisSpacing: 15,
          mainAxisSpacing: 20),
        children: availableCategories.map(
          (category) => CategoryGridItem(category: category, onSelectCategory: ()=>displayMealsScreen(context),)
          ).toList()
        ),
    );
  }
}