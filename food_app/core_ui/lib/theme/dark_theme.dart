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
  colorScheme: ColorScheme.dark(
    brightness: Brightness.dark,
    background: blackColor,
    primary: aquamarineDarkColor,
    secondary: Colors.black87,
    primaryContainer: Colors.black12.withOpacity(0.3),
    secondaryContainer: Colors.black45,
    tertiary: Colors.white,
    tertiaryContainer: Colors.white30,
    inversePrimary: Color.fromARGB(255, 43,74,74),
    inverseSurface:  Color.fromARGB(255, 9,40,39),
    onTertiary: Color.fromARGB(255, 105,164,162),
    onBackground: Colors.black45,
  ),
);
