import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter/widgets.dart';
import 'package:roll_dice/gradient_container.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        // backgroundColor: Color.fromARGB(255, 58, 22, 120),
        body: GradientContainer(colours: [
            Color.fromARGB(255, 156, 125, 209),
            Colors.deepPurpleAccent,
          ]),
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
