import 'package:flutter/material.dart';
import 'package:kittens/view/CatGrid.dart';

class HomeScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kittens',
      theme: new ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: CatGrid(),
    );
  }
}