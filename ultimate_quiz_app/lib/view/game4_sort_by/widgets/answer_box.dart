import 'package:flutter/material.dart';

class SortByAnswerBox extends StatelessWidget {
  const SortByAnswerBox(this.answer, {Key? key}) : super(key: key);
  final String answer;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 1),
      child: Text(
        answer,
        style: const TextStyle(fontSize: 15, fontFamily: 'Signika'),
      ),
    );
  }
}
