import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String name;
  final String email;
  final String mobile;
  final String collegename;

  const HomePage({
    Key? key,
    required this.name,
    required this.email,
    required this.mobile,
    required this.collegename,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: Text('Student info'),
      ),
      // You can use the constructor arguments here as needed.
      body: Form(
          child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: Column(children: [
          Padding(padding: EdgeInsets.all(50)),
          Image(
            image: AssetImage("images/logo.png"),
            height: 100.0,
            width: 100.0,
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text(name),
          ),
          ListTile(
            leading: Icon(Icons.email),
            title: Text(email),
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text(mobile),
          ),
          ListTile(
            leading: Icon(Icons.school),
            title: Text(collegename),
          ),
        ]),
      )),
    );
  }
}
