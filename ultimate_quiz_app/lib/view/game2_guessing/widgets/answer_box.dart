import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ultimate_quiz_app/providers/game_provider.dart';

class GuessingAnswerBox extends StatelessWidget {
  GuessingAnswerBox(
    this.text,
    this.index,
    this.isSelected,
    this.selectAnswer,
    this.correctAnswer,
    this.shouldRevealTruth,
    this.revealEverything,
  );
  final String text;
  final int index;
  final bool isSelected;
  final Function(int) selectAnswer;
  final int correctAnswer;
  //final List<bool> theTruth;
  final bool shouldRevealTruth;
  final Function() revealEverything;
  @override
  Widget build(BuildContext context) {
    final GameProvider gameProvider =
        Provider.of<GameProvider>(context, listen: false);
    return GestureDetector(
      onTap: () {
        if (gameProvider.game2ShouldDisableSelection == false) {
          selectAnswer(index);
          revealEverything();
          gameProvider.game2SelectedAnswer = index;
          gameProvider.game2ShouldDisableSelection = true;
          gameProvider.guessingGameTimer?.cancel();
        }
      },
      child: Container(
        height: 50,
        //width: double.infinity,
        margin: const EdgeInsets.only(right: 5, left: 5),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 1),
          borderRadius: BorderRadius.circular(15),
          color: shouldRevealTruth && correctAnswer == index
              ? Colors.green.shade600
              : shouldRevealTruth && isSelected
                  ? Colors.red.shade800
                  : null,
          gradient: shouldRevealTruth && correctAnswer == index
              ? null
              : shouldRevealTruth && isSelected
                  ? null
                  : isSelected
                      ? LinearGradient(colors: [
                          Colors.blue.shade900.withOpacity(0.9),
                          Colors.purple.shade900.withOpacity(0.9),
                          Colors.pink.shade900.withOpacity(0.9),
                        ])
                      : LinearGradient(colors: [
                          Colors.black45,
                          Colors.black54,
                        ]),
        ),
        child: GestureDetector(
          // style: ElevatedButton.styleFrom(
          //     primary: Colors.transparent,
          //     padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          //     // minimumSize: Size(50, 20),
          //     tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          //     elevation: 0,
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(15),
          //     )),
          child: FittedBox(
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10),
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Sarala',
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
