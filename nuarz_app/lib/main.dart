import 'package:flutter/material.dart';
import 'package:nuarz_app/home/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: HomePage(),
    );
  }
}
