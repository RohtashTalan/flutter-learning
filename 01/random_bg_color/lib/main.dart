import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'BG Changer',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: Scaffold(
          appBar: AppBar(
            title: Text("Random BackGround"),
          ),
          body: HomePage(),
        ));
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var colors = [
    Colors.amber,
    Colors.black,
    Colors.blue,
    Colors.yellow,
    Colors.green,
    Colors.red,
    Colors.pink,
    Colors.orange
  ];

  var currentColor = Colors.white;

  setRandomColor() {
    var rnd = Random().nextInt(7);
    setState(() {
      currentColor = colors[rnd];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: currentColor,
        child: Center(
          child: ElevatedButton(
            onPressed: setRandomColor,
            child: const Text(
              'Change Color',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
             ),
          ),
        ));
  }
}
