import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData themeData = ThemeData(
    primarySwatch: Colors.purple,
    fontFamily: "Lato",
    scaffoldBackgroundColor: Colors.black,
    iconTheme: const IconThemeData(color: Colors.white),
    textTheme: const TextTheme(
      headline6: TextStyle(
        color: Colors.black,
        fontSize: 12,
        fontWeight: FontWeight.w700,
      ),
      headline5: TextStyle(
        color: Colors.black,
        fontSize: 30,
        fontWeight: FontWeight.w800,
      ),
    ),
  );
}
