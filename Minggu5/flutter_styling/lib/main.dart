import 'package:flutter/material.dart';
import 'package:flutter_styling/home_screen.dart';
import 'package:flutter_styling/recent_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
