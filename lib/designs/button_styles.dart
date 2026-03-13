import 'package:flutter/material.dart';

class ButtonGradients {
  static const LinearGradient circularButtonGradient = LinearGradient(
    colors: [
      Color(0xFFAC08D9), // Purple
      Color(0xFFE0A2F1), // Light Purple
      Color(0xFFFFFFFF), // White
    ],
    stops: [0.17, 0.69, 0.89],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
