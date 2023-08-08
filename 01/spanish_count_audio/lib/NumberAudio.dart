import 'package:flutter/material.dart';

class NumberAudio {
  late String audioUri;
  late MaterialColor buttonColor;
  late String buttonText;

  NumberAudio(String aU, MaterialColor bC, String bT) {
    audioUri = aU;
    buttonColor = bC;
    buttonText = bT;
  }
}
