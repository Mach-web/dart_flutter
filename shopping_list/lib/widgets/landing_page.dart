import 'package:flutter/material.dart';
import 'package:shopping_list/data/dummy_items.dart';

class LandingPage extends StatelessWidget{
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: 
          groceryItems.map((item) => 
            Row(
              children: [
                Text(item.name),
                const Spacer(),
                Text(item.quantity.toString()),
              ],
            ),
          ).toList()
        ,
      ),
      );
  }
}