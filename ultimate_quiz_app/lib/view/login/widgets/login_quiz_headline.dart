import 'package:flutter/material.dart';

class LoginQuizHeadline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 50),
      child: const Text(
        "Ko ne zna,\n znat ce poslije!",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontFamily: "Retrolight",
          fontSize: 31,
        ),
      ),
    );
  }
}
