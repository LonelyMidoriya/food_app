import 'package:core/consts/consts.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.dark(
    brightness: Brightness.light,
    background: Colors.white,
    primary: orangeColor,
    secondary: Colors.white,
    primaryContainer: Colors.white,
    secondaryContainer: Colors.black45,
    tertiary: Colors.black,
  ),
);
