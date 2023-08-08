import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  // const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
// import images
  AssetImage circle = AssetImage("images/circle.png");
  AssetImage lucky = AssetImage("images/rupee.png");
  AssetImage unlucky = AssetImage("images/sadFace.png");

  // get an array
  late List<String> itemArray;
  late int luckyNumber;

  @override
  void initState() {
    super.initState();
    itemArray = List.generate(25, (index) => "empty");
    generateRandomNumber();
  }

  generateRandomNumber() {
    int random = Random().nextInt(25);
    setState(() {
      luckyNumber = random;
    });
  }

// define a get image method
  getImage(index) {
    String currentState = itemArray[index];
    switch (currentState) {
      case "lucky":
        return lucky;
        break;
      case "unlucky":
        return unlucky;
        break;
      case "empty":
        return circle;
        break;
    }
    return circle;
  }

// play game
  playGame(index) {
    if (luckyNumber == index) {
      setState(() {
        itemArray[index] = "lucky";
      });
    } else {
      setState(() {
        itemArray[index] = "unlucky";
      });
    }
  }

  // Show All
  showAll() {
    setState(() {
      itemArray = List.filled(25, "unlucky");
      itemArray[luckyNumber] = "lucky";
    });
  }

  // rest game
  resetGame() {
    setState(() {
      itemArray = List.filled(25, "empty");
    });

    generateRandomNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Scratch and win"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(20.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0),
                itemCount: itemArray.length,
                itemBuilder: (context, i) => SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 210, 210, 210)),
                    onPressed: () {
                      playGame(i);
                    },
                    child: Image(
                      image: getImage(i),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(15.0),
              child: ElevatedButton(
                onPressed: () {
                  showAll();
                },
                child: Text("Show All"),
              ),
            ),
            Container(
              margin: EdgeInsets.all(15.0),
              child: ElevatedButton(
                onPressed: () {
                  resetGame();
                },
                child: Text("Rest All"),
              ),
            )
          ],
        ));
  }
}
