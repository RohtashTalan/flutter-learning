import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AssetImage cross = AssetImage("images/cross.png");
  AssetImage circle = AssetImage("images/circle.png");
  AssetImage edit = AssetImage("images/edit.png");

  bool isCross = true;
  String message = '';
  late List<String> gameState;

  @override
  void initState() {
    super.initState();
    setState(() {
      this.gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
    });
  }

// reset game
  resetGame() {
    setState(() {
      this.gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
      this.message = "";
    });
  }

// get image to fill
  getImage(String value) {
    switch (value) {
      case 'empty':
        return edit;
        break;
      case 'cross':
        return cross;
        break;
      case 'circle':
        return circle;
        break;
    }
  }

// play game
  playGame(int index) {

    if (gameState[index] == 'empty' && message == '') {
      setState(() {
        if (isCross) {
          gameState[index] = 'cross';
        } else {
          gameState[index] = 'circle';
        }
        isCross = !isCross;
        checkWin();
      });
    }
  }

// win logic
  checkWin() {
    List winLogic = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 5, 8],
      [2, 5, 7],
    ];

    for (var logic in winLogic) {
      var [a, b, c] = logic;

      if (gameState[a] == gameState[b] &&
          gameState[a] == gameState[c] &&
          gameState[a] != 'empty') {
        setState(() {
          message = '${gameState[a]} Wins';
        });
        return;
      }
    }

    if (!gameState.contains('empty')) {
      setState(() {
        message = 'Game Draw';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tic Tac Toe')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(20.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0),
              itemCount: gameState.length,
              itemBuilder: (context, i) => SizedBox(
                height: 100.0,
                width: 100.0,
                child: MaterialButton(
                  onPressed: () {
                    playGame(i);
                  },
                  child: Image(image: getImage(gameState[i])),
                ),
              ),
            ),
          ),
          Text(message, style: TextStyle(
            fontSize: 22,
          ),),
          MaterialButton(
            onPressed: resetGame,
            color: Colors.purple,
            child: Text(
              'Reset Game',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text('Rohtash Talan', style: TextStyle(fontSize: 20)),
          )
        ],
      ),
    );
  }
}
