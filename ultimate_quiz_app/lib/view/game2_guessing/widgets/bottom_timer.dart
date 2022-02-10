import 'package:flutter/material.dart';

class GuessingBottomTimer extends StatefulWidget {
  @override
  State<GuessingBottomTimer> createState() => _GuessingBottomTimerState();
}

class _GuessingBottomTimerState extends State<GuessingBottomTimer> {
  int countdown = 5;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: Text(
        countdown.toString(),
        style: TextStyle(
          fontFamily: 'Acme',
          fontSize: 30,
        ),
      ),
    );
  }
}
