// ignore: file_names
import 'package:flutter/material.dart';
import 'NumberAudio.dart';
import 'package:audioplayers/audioplayers.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AudioPlayer audioplayer = AudioPlayer();

  List<NumberAudio> numberList = [
    NumberAudio("one.wav", Colors.red, "One"),
    NumberAudio("two.wav", Colors.red, "two"),
    NumberAudio("three.wav", Colors.red, "three"),
    NumberAudio("four.wav", Colors.red, "four"),
    NumberAudio("five.wav", Colors.red, "five"),
    NumberAudio("six.wav", Colors.red, "six"),
    NumberAudio("seven.wav", Colors.red, "seven"),
    NumberAudio("eight.wav", Colors.red, "eight"),
    NumberAudio("nine.wav", Colors.red, "nine"),
    NumberAudio("ten.wav", Colors.red, "Ten"),
  ];

  play(uri) {
    audioplayer.play(UrlSource('/assets/' + uri));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Spanish Number"),
      ),
      body: Container(
        child: Center(
          child: Column(children: [
            Image(image: AssetImage("images/logo.png")),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2.0,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0),
                itemCount: numberList.length,
                itemBuilder: (context, i) => SizedBox(
                  width: 100.0,
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: () {
                      play(numberList[i].audioUri);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: numberList[i].buttonColor),
                    child: Text(
                      numberList[i].buttonText,
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
