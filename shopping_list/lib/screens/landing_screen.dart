import 'package:flutter/material.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/screens/new_item.dart';

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
  void _removeItem(GroceryItem item){
    final itemIndex = groceryItems.indexOf(item);
    setState(() {
      groceryItems.remove(item);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Item deleted"),
        duration: const Duration(seconds: 5),
        action: SnackBarAction(
          label: "Undo", 
          onPressed: (){
            setState(() {
              groceryItems.insert(itemIndex, item);
            });
          }),
        ),
    );
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
      body: groceryItems.isEmpty
      ? Center(
        child: Text("Use the '+' icon to add some grocery items",
        style: Theme.of(context).textTheme.titleMedium,
        ),)
      : ListView.builder(
      itemCount: groceryItems.length,
      itemBuilder: (ctx, index) =>
        Dismissible(
          key: ValueKey(groceryItems[index].id),
          child: ListTile(
            leading: Container(
              width: 20,
              height: 20,
              color: groceryItems[index].category.color,
            ),
            title: Text(groceryItems[index].name),
            trailing: Text(groceryItems[index].quantity.toString()),
          ),
          onDismissed: (direction){
            _removeItem(groceryItems[index]);
            },
          ),
        ),
    );
  }
}