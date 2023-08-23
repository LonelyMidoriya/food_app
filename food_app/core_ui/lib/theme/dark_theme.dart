import 'package:core/constants/colors.dart';
import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  inputDecorationTheme: const InputDecorationTheme(
    filled: true,
    fillColor: blackColor,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      iconColor: MaterialStateProperty.all(Colors.white),
    ),
  ),
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    brightness: Brightness.dark,
    background: blackColor,
    primary: purpleColor,
    secondary: Colors.black87,
    primaryContainer: Colors.white24,
    secondaryContainer: Colors.black45,
    tertiary: Colors.white,
  ),
);
