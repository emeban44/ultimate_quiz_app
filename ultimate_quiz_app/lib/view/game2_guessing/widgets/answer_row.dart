import 'package:flutter/material.dart';
import 'package:ultimate_quiz_app/view/game2_guessing/widgets/answer_box.dart';

class GuessingAnswerRow extends StatelessWidget {
  GuessingAnswerRow(this.answer1, this.answer2);
  final String answer1;
  final String answer2;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10.0, right: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: GuessingAnswerBox(answer1)),
          Expanded(child: GuessingAnswerBox(answer2)),
        ],
      ),
    );
  }
}
