import 'package:core/constants/colors.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  inputDecorationTheme: const InputDecorationTheme(
    filled: true,
    fillColor: Colors.black12,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      iconColor: MaterialStateProperty.all(Colors.black87),
    ),
  ),
  brightness: Brightness.light,
  colorScheme: const ColorScheme.dark(
    brightness: Brightness.light,
    background: Colors.white,
    primary: orangeColor,
    secondary: Colors.white,
    primaryContainer: Colors.white,
    secondaryContainer: Colors.black45,
    tertiary: Colors.black87,
  ),
);
