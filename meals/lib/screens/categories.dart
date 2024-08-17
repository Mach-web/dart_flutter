import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/widgets/category_grid_item.dart';
import 'package:meals/screens/meal.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';

class CategoriesScreen extends StatefulWidget{
  const CategoriesScreen({super.key, 
  // required this.toggleFavourite, 
  required this.filteredMeals
  });

  // final Function(Meal meal) toggleFavourite;
  final List<Meal> filteredMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
      lowerBound: 0,
      upperBound: 1);

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void displayMealsScreen(BuildContext context, Category category){
    final categoryMeals = widget.filteredMeals
      .where((meal)=>meal.categories
      .contains(category.id),)
      .toList();
    Navigator.push(context, MaterialPageRoute(
      builder: (ctx) => MealsScreen(title: category.title, meals: categoryMeals,
      //  toggleFavourite: toggleFavourite,
       ),
      ),
    );
  }

   @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      child:  GridView(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          crossAxisSpacing: 15,
          mainAxisSpacing: 20),
        children: availableCategories.map(
          (category) => CategoryGridItem(category: category, onSelectCategory: ()=>displayMealsScreen(context, category),)
          ).toList()
          ),
      builder: (context, child){
        return Padding(
          padding: EdgeInsets.only(
            top: (1 - _animationController.value) * 200
            ),
            child: child,
            );
      });
  }
}