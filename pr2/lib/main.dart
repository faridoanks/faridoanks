import 'package:flutter/material.dart';
import 'package:news/drawer.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

GlobalKey _scaffold = GlobalKey();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffold,
      appBar: AppBar(
        centerTitle: true,
        title: Text('belajar '),
      ),
      drawer: Konstant(),
      endDrawer: Konstant(),
      body: Center(child: Text('belajar')),
    );
  }
}
