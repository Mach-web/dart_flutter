import 'package:flutter/material.dart';
import 'package:shopping_list/widgets/landing_body.dart';

class LandingScreen extends StatelessWidget{
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Your Groceries"
        ),
      ),
      body:  const LandingBody()
    );
  }
}