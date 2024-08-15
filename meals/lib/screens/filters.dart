import 'package:flutter/material.dart';
// import 'package:meals/widgets/main_drawer.dart';
// import 'package:meals/screens/tabs.dart';

class FiltersScreen extends StatefulWidget{
  const FiltersScreen({super.key});
  @override  
  State<FiltersScreen> createState(){
    return _FiltersScreenState();
  }
}

enum Filters {gluttenFree, lactoseFree, vegetarian, vegan}

bool gluttenFreeFilterState = false;
bool lactoseFreeFilterState = false;
bool vegetarianFreeFilterState = false;
bool veganFreeFilterState = false;

class _FiltersScreenState extends State<FiltersScreen>{
  @override
  Widget build(BuildContext context) {
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
          Navigator.of(context).pop({
            Filters.gluttenFree: gluttenFreeFilterState,
            Filters.lactoseFree: lactoseFreeFilterState,
            Filters.vegetarian: vegetarianFreeFilterState,
            Filters.vegan: veganFreeFilterState
          });
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
}