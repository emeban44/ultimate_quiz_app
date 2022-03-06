import 'package:flutter/material.dart';

class SortByCorrectAnswerBox extends StatelessWidget {
  const SortByCorrectAnswerBox(this.answer, {Key? key}) : super(key: key);
  final String answer;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        answer,
        style: const TextStyle(fontFamily: 'Signika', fontSize: 22),
      ),
    );
  }
}
