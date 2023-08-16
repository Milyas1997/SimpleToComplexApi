import 'package:flutter/material.dart';

import 'screen/json_three_screen.dart';
import 'screen/json_two_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: JsonThreeScreen(),
    );
  }
}
