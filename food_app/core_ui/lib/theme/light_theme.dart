import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.dark(
    brightness: Brightness.light,
    background: Colors.white,
    primary: Color(0xffff8a65),
    secondary: Colors.white,
    primaryContainer: Colors.white,
    secondaryContainer: Colors.black26,
    tertiary: Colors.white70,
  ),
);
