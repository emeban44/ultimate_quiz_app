import 'dart:async';

import 'package:flutter/material.dart';

class CountdownDialog extends StatefulWidget {
  @override
  State<CountdownDialog> createState() => _CountdownDialogState();
}

class _CountdownDialogState extends State<CountdownDialog> {
  int number = 5;
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        number--;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        color: Colors.amber,
        child: Text(number.toString()),
      ),
    );
  }
}
