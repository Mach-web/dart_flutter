import 'package:flutter/material.dart';
import 'package:shopping_list/data/dummy_items.dart';

class LandingBody extends StatelessWidget{
  const LandingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: groceryItems.length,
      itemBuilder: (ctx, index) =>
        ListTile(
          leading: Container(
            width: 20,
            height: 20,
            color: groceryItems[index].category.color,
          ),
          title: Text(groceryItems[index].name),
          trailing: Text(groceryItems[index].quantity.toString()),
        )
      );
  }
}