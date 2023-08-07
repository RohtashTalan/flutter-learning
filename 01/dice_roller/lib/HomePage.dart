
import 'dart:math';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AssetImage one = const AssetImage("images/one.png");
  AssetImage two = const AssetImage("images/two.png");
  AssetImage three = const AssetImage("images/three.png");
  AssetImage four = const AssetImage("images/four.png");
  AssetImage five = const AssetImage("images/five.png");
  AssetImage six = const AssetImage("images/six.png");

  late AssetImage diceImage;

  @override
  void initState() {
    super.initState();
    setState(() {
      diceImage = one;
    });
  }

  void rollDice() {
    int random = (1 + (Random().nextInt(6)));

   late AssetImage newImage;
    switch (random) {
      case 1:
        newImage = one;
        break;
      case 2:
        newImage = two;
        break;
      case 3:
        newImage = three;
        break;
      case 4:
        newImage = four;
        break;
      case 5:
        newImage = five;
        break;
      case 6:
        newImage = six;
        break;
    }
    setState(() {
      diceImage = newImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dice Roller'),
      ),
      
      body: Container(
        child: Center(
            // mainAxisAligment: MainAxisAlignment.center,
            child: Column(
              children: [
                Image(
                  image: diceImage,
                  width: 200.0,
                  height: 200.0,
                ),
                Container(
                  margin: EdgeInsets.only(top: 100.0),
                  child: ElevatedButton(
                    onPressed: rollDice,
                      child: Text(
                    'Roll the dice',
                    style: TextStyle(fontSize: 20),
                  )),
                )
              ],
            )),
      ),
    );
  }
}