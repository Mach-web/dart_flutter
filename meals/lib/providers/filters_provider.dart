import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/meals_provider.dart';

enum Filters {gluttenFree, lactoseFree, vegetarian, vegan}

class FilterNotifier extends StateNotifier<Map<Filters, bool>>{
  FilterNotifier() : super({
    Filters.gluttenFree: false,
    Filters.lactoseFree: false,
    Filters.vegetarian: false,
    Filters.vegan: false,
  });

  void changeFilterState(Filters filter, bool isActive){
    state = {
      ...state,
      filter: isActive
    };
  }
  void setFilters(Map<Filters, bool> chosenFilters){
    state = chosenFilters;
  }
}

final filterProvider = StateNotifierProvider<FilterNotifier, Map<Filters, bool>>((ref){
  return FilterNotifier();
});

final filteredMealsProvider = Provider((ref){
  final meals = ref.watch(mealsProvider);
  final selectedFilters = ref.watch(filterProvider);
  
  return meals.where((meal){
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
});