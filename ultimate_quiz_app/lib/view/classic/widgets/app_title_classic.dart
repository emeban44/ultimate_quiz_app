import 'package:flutter/material.dart';

class AppTitleClassic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 70),
      child: const Text(
        'KO NE ZNA, \nZNAT CE POSLIJE!',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'Retrolight',
          fontSize: 32,
        ),
      ),
    );
  }
}
