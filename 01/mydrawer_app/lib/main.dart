import 'package:flutter/material.dart';
import 'MyHomePage.dart';
import 'Categories.dart';




void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Drawer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
      routes: <String, WidgetBuilder>{
        "/a": (BuildContext context)=>Categories(),

      },
    );
  }
}
