import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filters {gluttenFree, lactoseFree, vegetarian, vegan}

class FilterMealsNotifier extends StateNotifier<Map<Filters, bool>>{
  FilterMealsNotifier() : super({
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
}

final filterMealsProvider = StateNotifierProvider<FilterMealsNotifier, Map<Filters, bool>>((ref){
  return FilterMealsNotifier();
});