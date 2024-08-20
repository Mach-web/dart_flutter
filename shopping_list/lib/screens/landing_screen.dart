import 'package:flutter/material.dart';
import 'package:shopping_list/screens/new_item.dart';
import 'package:shopping_list/widgets/landing_body.dart';

class LandingScreen extends StatefulWidget{
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  void _addItem(){
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context){
        return NewItem();
      })
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
      body:  const LandingBody()
    );
  }
}