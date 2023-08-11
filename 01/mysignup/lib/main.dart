import 'package:flutter/material.dart';
import 'SignUpPage.dart';
import 'HomePage.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'User Detials app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: SignUpPage(),
    );
  }
}