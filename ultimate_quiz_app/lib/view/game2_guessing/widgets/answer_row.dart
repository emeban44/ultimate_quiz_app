import 'package:flutter/material.dart';
import 'package:ultimate_quiz_app/providers/game_provider.dart';
import 'package:ultimate_quiz_app/view/game2_guessing/widgets/answer_box.dart';

class GuessingAnswerRow extends StatelessWidget {
  GuessingAnswerRow({
    required this.answer1,
    required this.answer2,
    required this.index1,
    required this.index2,
    required this.selection,
    required this.selectAnswer,
    required this.correctAnswer,
    required this.revealEverything,
    required this.shouldRevealTruth,
  });
  final String answer1;
  final String answer2;
  final int index1;
  final int index2;
  final List<bool> selection;
  final Function(int) selectAnswer;
  final int correctAnswer;
  //final List<bool> theTruth;
  final bool shouldRevealTruth;
  final Function() revealEverything;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10.0, right: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: GuessingAnswerBox(
            answer1,
            index1,
            selection[index1],
            selectAnswer,
            correctAnswer,
            shouldRevealTruth,
            revealEverything,
          )),
          Expanded(
              child: GuessingAnswerBox(
            answer2,
            index2,
            selection[index2],
            selectAnswer,
            correctAnswer,
            shouldRevealTruth,
            revealEverything,
          )),
        ],
      ),
    );
  }
}
