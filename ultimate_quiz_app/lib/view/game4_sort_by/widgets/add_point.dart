import 'package:flutter/material.dart';

class SortByAddPoint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '+',
            style: TextStyle(
                color: Colors.greenAccent.shade400,
                fontSize: 23,
                letterSpacing: 1.5,
                fontFamily: 'Retrolight',
                fontWeight: FontWeight.bold),
          ),
          Text(
            '1',
            style: TextStyle(
                color: Colors.greenAccent.shade400,
                fontSize: 23,
                letterSpacing: 1.5,
                fontFamily: 'Lexend',
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
