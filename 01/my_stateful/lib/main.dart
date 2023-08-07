import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyButton(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyButton extends StatefulWidget {
  @override
  MyButtonState createState() {
    return MyButtonState();
  }
}

class MyButtonState extends State<MyButton> {
  int counter = 0;
  List<String> spanishNumbers = [
    "uno",
    "dos",
    "tres",
    "cuatro",
    "cinco",
    "seite",
    "ocho",
    "nueve",
    "dietz"
  ];

  String defaultText = "Spanish Numbers";

  void displaySNumbers() {
    setState(() {
      if (counter < 9) {
        counter = counter + 1;
      } else {
        counter = 0;
      }
      defaultText = spanishNumbers[counter];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My stateful App'),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(defaultText, style: const TextStyle(fontSize: 30.0)),
            const Padding(padding: EdgeInsets.all(10.0)),
            ElevatedButton(
                onPressed: displaySNumbers, child: const Text('Call numbers'))
          ],
        ),
      ),
    );
  }
}
