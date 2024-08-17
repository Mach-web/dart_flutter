import 'package:flutter/material.dart';
// import 'package:meals/widgets/main_drawer.dart';
// import 'package:meals/screens/tabs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/filters_provider.dart';

class FiltersScreen extends ConsumerWidget{
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filterMealsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your filters"),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: activeFilters[Filters.gluttenFree]!, 
            onChanged: (isChecked){
              ref
              .read(filterMealsProvider.notifier)
              .changeFilterState(Filters.gluttenFree, isChecked);
              },
            title: Text(
                "Gluten free",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface
                ),),
            subtitle: Text(
                "Only include glutten free meals",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface
                ),
              ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Filters.lactoseFree]!, 
            onChanged: (isChecked){
              ref
              .read(filterMealsProvider.notifier)
              .changeFilterState(Filters.lactoseFree, isChecked);
              },
            title: Text(
                "Lactose free",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface
                ),),
            subtitle: Text(
                "Only include lactose free meals",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface
                ),
              ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Filters.vegetarian]!, 
            onChanged: (isChecked){
              ref
              .read(filterMealsProvider.notifier)
              .changeFilterState(Filters.vegetarian, isChecked);
              },
            title: Text(
                "Vegetarian",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface
                ),),
            subtitle: Text(
                "Only include vegetarian meals",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface
                ),
              ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Filters.vegan]!, 
            onChanged: (isChecked){
              ref
              .read(filterMealsProvider.notifier)
              .changeFilterState(Filters.vegan, isChecked);
              },
            title: Text(
                "Vegan",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface
                ),),
            subtitle: Text(
                "Only include vegan meals",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface
                ),
              ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          )
        ],
      ),
    );
  }
}

/*class FiltersScreen extends ConsumerStatefulWidget{
  const FiltersScreen({super.key});
  @override  
  ConsumerState<FiltersScreen> createState(){
    return _FiltersScreenState();
  }
}

bool gluttenFreeFilterState = false;
bool lactoseFreeFilterState = false;
bool vegetarianFreeFilterState = false;
bool veganFreeFilterState = false;

class _FiltersScreenState extends ConsumerState<FiltersScreen>{
  @override
  Widget build(BuildContext context) {
    // final activeFilters = ref.watch(filterMealsProvider);
    // gluttenFreeFilterState = activeFilters[Filters.gluttenFree]!;
    // lactoseFreeFilterState = activeFilters[Filters.lactoseFree]!;
    // vegetarianFreeFilterState = activeFilters[Filters.vegetarian]!;
    // veganFreeFilterState = activeFilters[Filters.vegan]!;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your filters"),
      ),
      // drawer: MainDrawer(
      //   onSelectDrawerItem: (identifier){
      //     Navigator.of(context).pop();
      //     if(identifier == 'meals'){
      //       Navigator.of(context).push(
      //         MaterialPageRoute(
      //           builder: (ctx) => const TabsScreen(),
      //           )
      //       );
      //     }
      //   }
      // ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (bool didPop){
          if(didPop) return;
          ref.read(filterMealsProvider.notifier).setFilters({
            Filters.gluttenFree: gluttenFreeFilterState,
            Filters.lactoseFree: lactoseFreeFilterState,
            Filters.vegetarian: vegetarianFreeFilterState,
            Filters.vegan: veganFreeFilterState
          });
          Navigator.of(context).pop();
        },
        child: Column(
          children: [
            SwitchListTile(
              value: gluttenFreeFilterState, 
              onChanged: (ischecked){
                setState(() {
                  gluttenFreeFilterState = ischecked;
                });
              },
              title: Text(
                "Gluten free",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface
                ),
              ),
              subtitle: Text(
                "Only include glutten free meals",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: lactoseFreeFilterState, 
              onChanged: (ischecked){
                setState(() {
                  lactoseFreeFilterState = ischecked;
                });
              },
              title: Text(
                "Lactose free",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface
                ),
              ),
              subtitle: Text(
                "Only include lactose free meals",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
             SwitchListTile(
              value: vegetarianFreeFilterState, 
              onChanged: (ischecked){
                setState(() {
                  vegetarianFreeFilterState = ischecked;
                });
              },
              title: Text(
                "Vegetarian",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface
                ),
              ),
              subtitle: Text(
                "Only include vegetarian meals",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
             SwitchListTile(
              value: veganFreeFilterState, 
              onChanged: (ischecked){
                setState(() {
                  veganFreeFilterState = ischecked;
                });
              },
              title: Text(
                "Vegan",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface
                ),
              ),
              subtitle: Text(
                "Only include vegan meals",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ),
      ),
    );
  }
}*/