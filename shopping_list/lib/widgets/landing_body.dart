import 'package:flutter/material.dart';
import 'package:shopping_list/models/grocery_item.dart';
// import 'package:shopping_list/data/dummy_items.dart';

class LandingBody extends StatelessWidget{
  const LandingBody({super.key, required this.groceryItems});

  final List<GroceryItem> groceryItems;
  @override
  Widget build(BuildContext context) {
    if(groceryItems.isEmpty){
      return Container(
        alignment: Alignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        padding: const EdgeInsets.all(15),
        child: Text(
          "Use the '+' icon to add some grocery items",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      );
    }
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