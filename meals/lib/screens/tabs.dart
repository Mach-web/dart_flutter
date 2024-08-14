import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/meal.dart';

class Tabs extends StatefulWidget{
  const Tabs({super.key});
  @override
  State<Tabs> createState() {
    return _TabsState();
  }
}

class _TabsState extends State<Tabs>{
  int _selectedPageIndex = 0;
  final List<Meal> favouriteMeals = [];

  void onToggleFavourite(Meal meal){
    final bool isFavorite = favouriteMeals.contains(meal);

    if(isFavorite){
      favouriteMeals.remove(meal);
    }
    else{
      favouriteMeals.add(meal);
    }
  }

  void _selectPage(int index){
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = CategoriesScreen(toggleFavourite: onToggleFavourite,);
    var activeScreenTitle = "What is your taste?";
    if(_selectedPageIndex == 1){
      activeScreen = MealsScreen(meals: [dummyMeals[1]], toggleFavourite: onToggleFavourite,);
      activeScreenTitle = "Your Favourites";
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activeScreenTitle),
      ),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favourites")
        ]),
    );
  }
}