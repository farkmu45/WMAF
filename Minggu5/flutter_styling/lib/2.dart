import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.dashboard),
          actions: const [Icon(Icons.search)],
          actionsIconTheme: const IconThemeData(color: Colors.yellow),
          backgroundColor: Colors.pinkAccent,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4.0),
            child: Container(
              color: Colors.orange,
              height: 4.0,
            ),
          ),
          centerTitle: true,
          title: const Text(
            'Belajar MaterialApp Scaffold',
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
