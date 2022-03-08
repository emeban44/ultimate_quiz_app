import 'package:flutter/material.dart';

class SortByWrongAnswer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      child: Text(
        'x',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.red, fontFamily: 'Acme', fontSize: 30),
      ),
    );
  }
}
