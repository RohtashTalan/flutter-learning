import 'package:flutter/material.dart';
import 'HomePage.dart';

// update pubspec file for image assets

void main() => runApp(MyaApp());

class MyaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Dice Roller',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}