import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>>{
  FavoriteMealsNotifier() : super([]);

  bool toggleFavoriteStatus(Meal meal){
    final bool isFavorite = state.contains(meal);

    if(isFavorite){
      state = state.where((m) => meal.id != m.id).toList();
      return false;
    }
    else{
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider = StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref){
  return FavoriteMealsNotifier();
});