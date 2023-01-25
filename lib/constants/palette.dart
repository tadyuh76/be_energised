import 'package:flutter/material.dart';

abstract class Palette {
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF202122);
  static const darkGrey = Color(0xFF232323);
  static const grey = Color(0xFF2C2C2D);
  static const lightGrey = Color(0xFFD9D9D9);
  static const background = Color(0xFF145B56);

  static const green = Color(0xFF3DCF6D);
  static const greenGradient = LinearGradient(
    colors: [Color(0xFF3DCF6D), Color(0xFF73E9C5)],
  );
  static const yellowGradient = LinearGradient(
    colors: [Color(0xFFFEDF30), Color(0xFFD4D188)],
  );
  static const redGradient = LinearGradient(
    colors: [Color(0xFFDD4A4A), Color(0xFFDD7F62)],
  );
}
