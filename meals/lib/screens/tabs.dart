import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meal.dart';
import 'package:meals/widgets/main_drawer.dart';

import 'package:meals/providers/meals_provider.dart';
import 'package:meals/providers/favorite_provider.dart';
import 'package:meals/providers/filters_provider.dart';

const Map<Filters, bool>kSelectedFilters = {
    Filters.gluttenFree: false,
    Filters.lactoseFree: false,
    Filters.vegan: false,
    Filters.vegetarian: false
  };

class TabsScreen extends ConsumerStatefulWidget{
  const TabsScreen({super.key});
  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsState();
  }
}

class _TabsState extends ConsumerState<TabsScreen>{
  int _selectedPageIndex = 0;
  // final List<Meal> favouriteMeals = [];
  // Map<Filters, bool> selectedFilters = kSelectedFilters;

  // void onToggleFavourite(Meal meal){
  //   final bool isFavorite = favouriteMeals.contains(meal);
  //   if(isFavorite){
  //     setState(() {
  //       favouriteMeals.remove(meal);
  //       _showInfoMessage("Meal removed from favorites");
  //     });
  //   }
  //   else{
  //     setState(() {
  //       favouriteMeals.add(meal);
  //       _showInfoMessage("Meal added to favorites");
  //     });
  //   }
  // }

  // void _showInfoMessage(String message){
  //   ScaffoldMessenger.of(context).clearSnackBars();
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text(message, style: Theme.of(context).textTheme.titleMedium!.copyWith(
  //         fontWeight: FontWeight.bold
  //       )),),
  //   );
  // }

  void _selectPage(int index){
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void onSelectDrawerItem(String identifier){
    Navigator.of(context).pop();
    if(identifier == "filters"){
      // final result = await 
      Navigator.of(context).push(
        MaterialPageRoute(builder: (ctx) => const FiltersScreen(),
        ),
      );
    // setState(() {
    //   selectedFilters = result ?? kSelectedFilters;    
    // });
    }
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProvider);
    final selectedFilters = ref.watch(filterMealsProvider);
    final filteredMeals = meals.where((meal){
      if(!meal.isGlutenFree && selectedFilters[Filters.gluttenFree]!){
        return false;
      }
      if(!meal.isLactoseFree && selectedFilters[Filters.lactoseFree]!){
        return false;
      }
      if(!meal.isVegan && selectedFilters[Filters.vegan]!){
        return false;
      }
      if(!meal.isVegetarian && selectedFilters[Filters.vegetarian]!){
        return false;
      }
      return true;
    }).toList();

    Widget activeScreen = CategoriesScreen(
      // toggleFavourite: onToggleFavourite, 
      filteredMeals: filteredMeals,);
    var activeScreenTitle = "What is your taste?";

    final favouriteMeals = ref.watch(favoriteMealsProvider);
    if(_selectedPageIndex == 1){
      activeScreen = MealsScreen(
        meals: favouriteMeals, 
        // toggleFavourite: onToggleFavourite,
        );
      activeScreenTitle = "Your Favourites";
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activeScreenTitle),
      ),
      drawer: MainDrawer(onSelectDrawerItem: onSelectDrawerItem,),
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