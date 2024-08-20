import 'package:flutter/material.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/screens/new_item.dart';
import 'package:shopping_list/widgets/landing_body.dart';

class LandingScreen extends StatefulWidget{
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final List<GroceryItem> groceryItems = [];
  void _addItem() async{
    final groceryItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(builder: (context){
        return NewItem();
      })
    );
    if(groceryItem == null){
      return;
    }
    setState(() {
      groceryItems.add(groceryItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Your Groceries"
        ),
      actions: [
        IconButton(
          onPressed: _addItem, 
          icon: const Icon(Icons.add))
      ],
      ),
      body:  LandingBody(groceryItems: groceryItems,)
    );
  }
}