import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        // backgroundColor: Color.fromARGB(255, 58, 22, 120),
        body: Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              colors: [
                Color.fromARGB(255, 152, 115, 216),
                Color.fromARGB(255, 85, 41, 215),
              ],
              ),
          ),
          child: const Center(
          child: Text("This is my first app?!!!!"),
          ),
        ),
      ),
    ),
  );
}
/*
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!!!!'),
        ),
      ),
    );
  }
}
*/
