import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget{
  const FiltersScreen({super.key});
  @override  
  State<FiltersScreen> createState(){
    return _FiltersScreenState();
  }
}

bool gluttenFreeFilterState = false;
class _FiltersScreenState extends State<FiltersScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your filter"),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: value, 
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
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface
              ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
        ],
      ),
    );
  }
}