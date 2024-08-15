import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meal.dart';
import 'package:meals/widgets/main_drawer.dart';

const Map<Filters, bool>kSelectedFilters = {
    Filters.gluttenFree: false,
    Filters.lactoseFree: false,
    Filters.vegan: false,
    Filters.vegetarian: false
  };

class TabsScreen extends StatefulWidget{
  const TabsScreen({super.key});
  @override
  State<TabsScreen> createState() {
    return _TabsState();
  }
}

class _TabsState extends State<TabsScreen>{
  int _selectedPageIndex = 0;
  final List<Meal> favouriteMeals = [];
  late Map<Filters, bool> selectedFilters;

  void onToggleFavourite(Meal meal){
    final bool isFavorite = favouriteMeals.contains(meal);
    if(isFavorite){
      setState(() {
        favouriteMeals.remove(meal);
        _showInfoMessage("Meal removed from favorites");
      });
    }
    else{
      setState(() {
        favouriteMeals.add(meal);
        _showInfoMessage("Meal added to favorites");
      });
    }
  }

  void _showInfoMessage(String message){
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: Theme.of(context).textTheme.titleMedium!.copyWith(
          fontWeight: FontWeight.bold
        )),),
    );
  }

  void _selectPage(int index){
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void onSelectDrawerItem(String identifier) async{
    Navigator.of(context).pop();
    if(identifier == "filters"){
      final result = await Navigator.of(context).push<Map<Filters, bool>>(
        MaterialPageRoute(builder: (ctx) => const FiltersScreen(),
        ),
      );
    setState(() {
      selectedFilters = result ?? kSelectedFilters;    
    });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = CategoriesScreen(toggleFavourite: onToggleFavourite,);
    var activeScreenTitle = "What is your taste?";
    if(_selectedPageIndex == 1){
      activeScreen = MealsScreen(meals: favouriteMeals, toggleFavourite: onToggleFavourite,);
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