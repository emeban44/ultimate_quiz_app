import 'package:flutter/material.dart';

class GuessingAnswerBox extends StatelessWidget {
  GuessingAnswerBox(this.text);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(right: 5, left: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 1),
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(colors: [
          Colors.blue.shade900.withOpacity(0.5),
          Colors.purple.shade900.withOpacity(0.5),
          Colors.pink.shade900.withOpacity(0.5),
        ]),
      ),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Signika',
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
