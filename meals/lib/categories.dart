import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget{
  const CategoriesScreen({super.key});

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("What's your taste"),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
        children: [
          Text("1")
        ],
        ),
    );
  }
}