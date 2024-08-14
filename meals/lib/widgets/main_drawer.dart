import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainDrawer extends StatelessWidget{
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Theme.of(context).colorScheme.secondary,
                Theme.of(context).colorScheme.secondary.withOpacity(0.65)
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter)
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 48,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                const SizedBox(width: 18,),
                Text("Cooking up",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ))
          
        ],
      ),
    );
  }
}