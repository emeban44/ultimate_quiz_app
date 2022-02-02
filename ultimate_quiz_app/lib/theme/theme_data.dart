import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData themeData = ThemeData(
    primarySwatch: Colors.purple,
    fontFamily: "Lato",
    scaffoldBackgroundColor: Colors.black,
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //     style: ElevatedButton.styleFrom(
    //         shape: RoundedRectangleBorder(
    //             borderRadius: BorderRadius.circular(15)))),
    iconTheme: const IconThemeData(color: Colors.white),
    textTheme: const TextTheme(
      headline1: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontFamily: 'Lato',
        fontWeight: FontWeight.w600,
      ),
      headline2: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w800,
        fontSize: 12,
      ),
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
      bodyText1: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontFamily: 'Viga',
        fontWeight: FontWeight.normal,
      ),
      bodyText2: TextStyle(
        color: Colors.white,
        fontSize: 28,
        //fontFamily: 'Acme',
        fontWeight: FontWeight.normal,
      ),
    ),
    // button: TextStyle(
    //   fontWeight: FontWeight.bold,
    //   fontFamily: 'Lato',
    //   color: Colors.white,
    //   fontSize: 20,
    // )),
  );
}
