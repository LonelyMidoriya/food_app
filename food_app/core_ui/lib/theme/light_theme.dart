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
  colorScheme: ColorScheme.dark(
    brightness: Brightness.light,
    background: Colors.white,
    primary: Color.fromARGB(255, 1,169,193),
    secondary: Colors.white,
    primaryContainer: Colors.white.withOpacity(0.6),
    secondaryContainer: Colors.black45,
    tertiary: Colors.black87,
    tertiaryContainer: Colors.black12,
    inversePrimary: Color.fromARGB(255, 218,228,229),
    inverseSurface:  Color.fromARGB(255, 148,192,194),
    onTertiary: Colors.white,
    onBackground: Color.fromARGB(255, 218,228,229),
  ),
);
